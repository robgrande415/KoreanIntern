% this script solves for the mass and rho parameters by using a particle
% filter approximation to the posterior distribution. The MAP parameters
% are then used for prediction of the CoM.
% It assumes that the prior distribution is
% proportional to a Gaussian distribution but with additional constraints
% on mass and rho being non negative and contrained to be 1 at max.
% The training sample is distinct from
% the testing sample ensuring that the algorithm is not overfitting to one
% dataset. See paper for details


%least squares
clear all;
close all;

%data preprocessing
filename = 'Subj6_1';
num_dim = 2;
preprocess
%delete y dimension
p_alt(:,2:3:end) = [];
%% id for joints
getJointID

%% design matrix for likelihood function

A = [];
B = [];

A = [A, XN_SKEL_NECK_stack, XN_SKEL_HEAD_stack-XN_SKEL_NECK_stack];

A = [A, XN_SKEL_LEFT_SHOULDER_stack, XN_SKEL_LEFT_ELBOW_stack - XN_SKEL_LEFT_SHOULDER_stack];
A = [A, XN_SKEL_LEFT_ELBOW_stack, XN_SKEL_LEFT_HAND_stack - XN_SKEL_LEFT_ELBOW_stack];

A = [A, XN_SKEL_RIGHT_SHOULDER_stack, XN_SKEL_RIGHT_ELBOW_stack - XN_SKEL_RIGHT_SHOULDER_stack];
A = [A, XN_SKEL_RIGHT_ELBOW_stack, XN_SKEL_RIGHT_HAND_stack - XN_SKEL_RIGHT_ELBOW_stack];

A = [A, XN_SKEL_TORSO_stack, XN_SKEL_NECK_stack - XN_SKEL_TORSO_stack];
A = [A, XN_SKEL_TORSO_stack, (XN_SKEL_LEFT_HIP_stack+XN_SKEL_RIGHT_HIP_stack)/2 - XN_SKEL_TORSO_stack];

A = [A, XN_SKEL_LEFT_HIP_stack, XN_SKEL_LEFT_KNEE_stack - XN_SKEL_LEFT_HIP_stack];
A = [A, XN_SKEL_LEFT_KNEE_stack, XN_SKEL_LEFT_FOOT_stack - XN_SKEL_LEFT_KNEE_stack];

A = [A, XN_SKEL_RIGHT_HIP_stack, XN_SKEL_RIGHT_KNEE_stack - XN_SKEL_RIGHT_HIP_stack];
A = [A, XN_SKEL_RIGHT_KNEE_stack, XN_SKEL_RIGHT_FOOT_stack - XN_SKEL_RIGHT_KNEE_stack];

%add offset to account for bias
I = eye(2);
A = [repmat(I,size(A,1)/2,1),A];

%% stack measurements

meas = q_at_p(:,2:3)';
meas(1,:) = meas(1,:)*-1; %mirror image for camera
meas = meas(:);

%% get prior
getPrior_Educated

%% approx distribution using PF 

%draw particles from prior distribution
w = 100; %controls bias/variance
theta_part =[];
num_particles = 100;
delete_thresh = exp(-100); 
dir_alpha = 0.01;
%init
mass = rand(11,1);
mass1 = mass/sum(mass); %normalize to 1
%draw for rho
rho1 = (rand(11,1)*1 +0.0);
offset1 = [0,0]';

MAP_sofar = -inf;

%create initial particles
particles = zeros(24,num_particles);
logweights = zeros(1,num_particles);
logweight_regfactor = 0;
for i =1:num_particles
    
    mass2 = randn(11,1).*sigma_mass + masses;
    mass2(mass2<0.01) = 0.01;
    
    %enforce symmetry
    mass2(2) = mass2(4);%upper arm
    mass2(3) = mass2(5); %lower arm
    mass2(8) = mass2(10); %upper leg
    mass2(9) = mass2(11); %lower leg
    
    %normalize
    mass2 = mass2/sum(mass2); %normalize to 1

    
    %draw for rho
    rho2 = randn(11,1).*sigma_rhos + rhos;
    rho2(rho2<0.01) = 0.01;
    rho2(rho2>0.99) = 0.99;
    %enforce symmetry
    rho2(2) = rho2(4);%upper arm
    rho2(3) = rho2(5); %lower arm
    rho2(8) = rho2(10); %upper leg
    rho2(9) = rho2(11); %lower leg
    
    
    %draw for offset
    offset2 = randn(2,1)/100;
    
    %concatenate
    theta_cand2 = [mass2, mass2.*rho2]';
    theta_cand2 = theta_cand2(:);
    theta_cand2 = [offset1; theta_cand2];
    
    particles(:,i) = theta_cand2;
    
    %get weight
    logweights(i) = sum(log(normpdf(mass2,masses,sigma_mass)) + log(normpdf(rho2,rhos,sigma_rhos)));
    
end
%normalize weights
%logweights = log( ( exp(logweights)/sum(exp(logweights)) )  );
logweight_regfactor = logweight_regfactor + max(logweights);
logweights = logweights - max(logweights); %prevents numerical issues

for i = 1:2:length(meas)
    
    %pop off measurement from queue
    y = meas(i:i+1);
    
    %get likelihood
    pred_out = A(i:i+1,:)*particles;
    llh = log(normpdf(repmat(y,1,num_particles),pred_out,w));
    llh = sum(llh,1);
    %regularize
    llh(llh<-100) = -100;
    %add to logweight
    logweights = logweights + llh;
    logweight_regfactor = logweight_regfactor + max(logweights);
    logweights = logweights - max(logweights); %prevents numerical issues
    
    %normalize weights
    weights = exp(logweights)/sum(exp(logweights));
    
    %get MAP
    [maxweight,ind] = max(weights);
    MAP_theta = particles(:,ind);
    
    %delete particles, smallest 10
    [lw_sort,lw_ind] = sort(logweights);
    ind = lw_ind(1:10);
    
    %loops over each particle deleted to resample
    for jj = ind
    
       %draw from multinomial
       temp = mnrnd(1,[weights,dir_alpha]/(1+dir_alpha));
       %draw from prior
       if temp(end) ==1
            mass2 = randn(11,1).*sigma_mass + masses;
            mass2(mass2<0.01) = 0.01;

            %enforce symmetry
            mass2(2) = mass2(4);%upper arm
            mass2(3) = mass2(5); %lower arm
            mass2(8) = mass2(10); %upper leg
            mass2(9) = mass2(11); %lower leg

            %normalize
            mass2 = mass2/sum(mass2); %normalize to 1


            %draw for rho
            rho2 = randn(11,1).*sigma_rhos + rhos;
            rho2(rho2<0.01) = 0.01;
            rho2(rho2>0.99) = 0.99;
            %enforce symmetry
            rho2(2) = rho2(4);%upper arm
            rho2(3) = rho2(5); %lower arm
            rho2(8) = rho2(10); %upper leg
            rho2(9) = rho2(11); %lower leg


            %draw for offset
            offset2 = randn(2,1)/100+ temp_particle(1:2);

            %concatenate
            theta_cand2 = [mass2, mass2.*rho2]';
            theta_cand2 = theta_cand2(:);
            theta_cand2 = [offset2; theta_cand2];

            particles(:,jj) = theta_cand2;
            logweights(jj) = log(dir_alpha); %hack
       else

           temp_particle = particles(:,temp(1:end-1)>0);
           temp_mass = temp_particle(3:2:end);
           temp_rho = temp_particle(4:2:end)./temp_mass;

            mass2 = randn(11,1).*sigma_mass/10 + temp_mass;
            mass2(mass2<0.01) = 0.01;

            %enforce symmetry
            mass2(2) = mass2(4);%upper arm
            mass2(3) = mass2(5); %lower arm
            mass2(8) = mass2(10); %upper leg
            mass2(9) = mass2(11); %lower leg

            %normalize
            mass2 = mass2/sum(mass2); %normalize to 1


            %draw for rho
            rho2 = randn(11,1).*sigma_rhos/10 + temp_rho;
            rho2(rho2<0.01) = 0.01;
            rho2(rho2>0.99) = 0.99;
            %enforce symmetry
            rho2(2) = rho2(4);%upper arm
            rho2(3) = rho2(5); %lower arm
            rho2(8) = rho2(10); %upper leg
            rho2(9) = rho2(11); %lower leg


            %draw for offset
            offset2 = randn(2,1)/100 + temp_particle(1:2);

            %concatenate
            theta_cand2 = [mass2, mass2.*rho2]';
            theta_cand2 = theta_cand2(:);
            theta_cand2 = [offset2; theta_cand2];

            particles(:,jj) = theta_cand2;
            logweights(jj) = logweights(:,temp(1:end-1)>0); %hack
            
       end %new particle or old
       %get weights
       logweights(jj) = sum(log(normpdf(mass2,masses,sigma_mass)) + log(normpdf(rho2,rhos,sigma_rhos)));   
       pred_out = A(1:i+1,:)*particles(:,jj);
       llh = log(normpdf(meas(1:i+1),pred_out,w));
       logweights(jj) = logweights(jj)+ sum(llh) - logweight_regfactor;
    end

    %normalize weights
    %logweights = log( ( exp(logweights)/sum(exp(logweights)) )  );
    logweight_regfactor = logweight_regfactor + max(logweights);
    logweights = logweights - max(logweights); %prevents numerical issues
    weights = exp(logweights)/sum(exp(logweights));
    
    %get MAP
    [maxweight,ind] = max(weights);
    MAP_theta = particles(:,ind);
    
    if mod(i-1,100) == 0
        disp(i)
    end
end


%% test on new data
%data preprocessing
filename = 'Subj6_2';
preprocess
%delete y dimension
p_alt(:,2:3:end) = [];
%% id for joints
getJointID

%% design matrix to invert
A = [];
B = [];

A = [A, XN_SKEL_NECK_stack, XN_SKEL_HEAD_stack-XN_SKEL_NECK_stack];

A = [A, XN_SKEL_LEFT_SHOULDER_stack, XN_SKEL_LEFT_ELBOW_stack - XN_SKEL_LEFT_SHOULDER_stack];
A = [A, XN_SKEL_LEFT_ELBOW_stack, XN_SKEL_LEFT_HAND_stack - XN_SKEL_LEFT_ELBOW_stack];

A = [A, XN_SKEL_RIGHT_SHOULDER_stack, XN_SKEL_RIGHT_ELBOW_stack - XN_SKEL_RIGHT_SHOULDER_stack];
A = [A, XN_SKEL_RIGHT_ELBOW_stack, XN_SKEL_RIGHT_HAND_stack - XN_SKEL_RIGHT_ELBOW_stack];

A = [A, XN_SKEL_TORSO_stack, XN_SKEL_NECK_stack - XN_SKEL_TORSO_stack];
A = [A, XN_SKEL_TORSO_stack, (XN_SKEL_LEFT_HIP_stack+XN_SKEL_RIGHT_HIP_stack)/2 - XN_SKEL_TORSO_stack];

A = [A, XN_SKEL_LEFT_HIP_stack, XN_SKEL_LEFT_KNEE_stack - XN_SKEL_LEFT_HIP_stack];
A = [A, XN_SKEL_LEFT_KNEE_stack, XN_SKEL_LEFT_FOOT_stack - XN_SKEL_LEFT_KNEE_stack];

A = [A, XN_SKEL_RIGHT_HIP_stack, XN_SKEL_RIGHT_KNEE_stack - XN_SKEL_RIGHT_HIP_stack];
A = [A, XN_SKEL_RIGHT_KNEE_stack, XN_SKEL_RIGHT_FOOT_stack - XN_SKEL_RIGHT_KNEE_stack];


%add offset
I = eye(2);
A = [repmat(I,size(A,1)/2,1),A];

%% stack outputs

meas = q_at_p(:,2:3)';
meas(1,:) = meas(1,:)*-1; %mirror image for camera
meas = meas(:);



%% plot
%reconstruction error
obs = q_at_p(:,2:3);
obs(:,1) = obs(:,1)*-1;
est = A*MAP_theta;
est = vec2mat(est,2);

lw = 1.4;
fs = 15;
h=figure;
subplot(2,1,1)
plot(tp,smooth(obs(:,1)),'b','LineWidth',lw);
hold on
plot(tp,smooth(est(:,1)),'r--','LineWidth',lw);
legend('Recorded','Estimate');
title('X CoM Prediction using PF','FontSize',fs)
%axis([5 115 -300 100])
axis tight

ylabel('X CoM position (mm)','FontSize',fs)
xlabel('Time (s)','FontSize',fs)
set(gca,'FontSize',fs)

subplot(2,1,2)
plot(tp,smooth(obs(:,2)),'b','LineWidth',lw);
hold on
plot(tp,smooth(est(:,2)),'r--','LineWidth',lw);
legend('Recorded','Estimate');
title('Y CoM Prediction using PF','FontSize',fs)
%axis([5 115 -150 75])
axis tight
ylabel('Y CoM position (mm)','FontSize',fs)
xlabel('Time (s)','FontSize',fs)
set(gca,'FontSize',fs)

[mass_Bayes, rho_Bayes,colors] = drawSkeleton(MAP_theta);
exp_ind = [1,6,7,2,3,8,9];
mass_Bayes(exp_ind)'
rho_Bayes(exp_ind)'
ABME = sum(mean(abs(est-obs)))
