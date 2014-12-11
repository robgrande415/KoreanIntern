% this script solves for the mass and rho parameters by using MCMC and
% sampling to get the MAP estimates. It assumes that the prior distribution is
% proportional to a Gaussian distribution but with additional constraints
% on mass and rho being non negative and contrained to be 1 at max.
% The training sample is distinct from
% the testing sample ensuring that the algorithm is not overfitting to one
% dataset. See paper for details

clear all;
close all;

%data preprocessing
filename = 'Dataset1';
preprocess
%delete y dimension
p_alt(:,2:3:end) = [];
%% id for joints
num_dim=2;
getJointID

%% design matrix for probability

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

%% stack measurement outputs

meas = q_at_p(:,2:3)';
meas(1,:) = meas(1,:)*-1; %mirror image for camera
meas = meas(:);

%% get prior parameters
getPrior_Educated

%% get distribution using MH MCMC

%sample according to prior
num_samp = 1e4;
w = 100; %controls bias/variance
theta_part =[];


%init
mass = rand(11,1);
mass1 = mass/sum(mass); %normalize to 1
%draw for rho
rho1 = (rand(11,1)*1 +0.0);
offset1 = [0,0]';

llh_stack = zeros(1,num_samp);
stuck = 0;
MAP_sofar = -inf;
for i = 1:num_samp
    
    
    %if stuck, reinit
    if stuck > 2000
        stuck = 0;
        mass = rand(11,1);
        mass1 = mass/sum(mass); %normalize to 1
        %draw for rho
        rho1 = (rand(11,1)*1 +0.0);
    end

    
    %uniform, prior is equal to 1 everywhere
    %draw for masses, gaussian truncated 
    mass2 = randn(11,1)*0.01+mass1;
    mass2(mass2<0.01) = 0.01;
    
    %enforce symmetry
    mass2(2) = mass2(4);%upper arm
    mass2(3) = mass2(5); %lower arm
    mass2(8) = mass2(10); %upper leg
    mass2(9) = mass2(11); %lower leg
    
    %normalize
    mass2 = mass2/sum(mass2); %normalize to 1

    
    %draw for rho
    rho2 = randn(11,1)*0.01+rho1;
    rho2(rho2<0.01) = 0.01;
    rho2(rho2>0.99) = 0.99;
    %enforce symmetry
    rho2(2) = rho2(4);%upper arm
    rho2(3) = rho2(5); %lower arm
    rho2(8) = rho2(10); %upper leg
    rho2(9) = rho2(11); %lower leg
    
    %draw for offset
    offset2 = offset1 + randn(2,1)/100;
    
    %concatenate
    theta_cand1 = [mass1, mass1.*rho1]';
    theta_cand1 = theta_cand1(:);
    theta_cand1 = [offset1; theta_cand1];
    
    theta_cand2 = [mass2, mass2.*rho2]';
    theta_cand2 = theta_cand2(:);
    theta_cand2 = [offset2; theta_cand2];
    




    %get prior probability
    pr1 = sum(log(normpdf(mass1,masses,sigma_mass)) + log(normpdf(rho1,rhos,sigma_rhos)));
    pr1(pr1<-500) = -500; %enforces regularization 
    pr2 = sum(log(normpdf(mass2,masses,sigma_mass)) + log(normpdf(rho2,rhos,sigma_rhos)));
    pr2(pr2<-500) = -500;%enforces regularization 
    
    %get likelihood
    pred_out1 = A*theta_cand1;
    llh1 = log(normpdf(meas,pred_out1,w));
    %regularize
    llh1(llh1<-500) = -500;%enforces regularization 
    llh1 = sum(llh1);
    
    pred_out2 = A*theta_cand2;
    llh2 = log(normpdf(meas,pred_out2,w));
    %regularize
    llh2(llh2<-500) = -500;%enforces regularization 
    llh2 = sum(llh2);
    
    llh_stack(i) = llh1;
    %draw bernoulli for acceptance
    a = rand;
    b = min([exp(llh2+pr2-llh1-pr1),1]);
    
    if a < b
        theta_part = [theta_part, theta_cand2];
        mass1 = mass2;
        rho1 = rho2;
        offset1 = offset2;
        llh_stack(i) = llh2;
        %save MAP
        if llh2 > MAP_sofar
            MAP_theta = theta_cand2;
            MAP_sofar = llh2;
        end
    else 
        stuck = stuck+1;
    end
    if mod(i,100) == 0
        disp(i)
    end
end


%% test on new data
%data preprocessing
filename = 'Dataset3';
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
RMSE = sum(mean(abs(est-obs)))

lw = 1.4;
fs = 15;
h=figure;
subplot(2,1,1)
plot(tp,smooth(obs(:,1)),'b','LineWidth',lw);
hold on
plot(tp,smooth(est(:,1)),'r--','LineWidth',lw);
legend('Recorded','Estimate');
title('X CoM Prediction using MH','FontSize',fs)
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
title('Y CoM Prediction using MH','FontSize',fs)
%axis([5 115 -150 75])
axis tight
ylabel('Y CoM position (mm)','FontSize',fs)
xlabel('Time (s)','FontSize',fs)
set(gca,'FontSize',fs)
[mass_Bayes, rho_Bayes,colors] = drawSkeleton(MAP_theta);
exp_ind = [1,6,7,2,3,8,9];
mass_Bayes(exp_ind)'
rho_Bayes(exp_ind)'