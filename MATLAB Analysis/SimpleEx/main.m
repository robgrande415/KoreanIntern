%main
close all;
clear all;

%generate Data
generateData

%% train gonzalez algorithm

A = [];
%get xy thetas
num_dim = 3;
A = appendMat(A,stack0,stack1,num_dim);
%add identities
I = [eye(2)];
A = [repmat(I,size(A,1)/2,1),A];
%other joints
A = appendMat(A,stack1,stack2,num_dim);
A = appendMat(A,stack2,stack3,num_dim);


%stack outputs
meas = CoM(1:2,:);
meas = meas(:);

%solve using LS
R = A\meas;

%% train Bayes LS/Conj Prior

%make matrix
A= [];
A = [A, stack0CP, stack1CP-stack0CP];
A = [A, stack1CP, stack2CP-stack1CP];
A = [A, stack2CP, stack3CP-stack2CP];
%add offset
I = eye(2);
A = [repmat(I,size(A,1)/2,1),A];

%prior
mu0 = repmat([1/3 1/6]',size(A,2)/2,1);
sigVec = repmat([1/16 1/64]',size(A,2)/2,1);
%append for offset
mu0(1:2) = [0;0];
sigVec(1:2) = [1;1]/100;
%more calcs
sigma0 = diag(sigVec);
w = 1;
lambda0 = sigma0^-1;
SigmaP = w^2 * (A'*A + (w^2*lambda0))^-1;

%solve
theta_Bayes = SigmaP * ((w^-2)*A'*meas + lambda0*mu0);

%% train MCMC

%sample according to prior
num_samp = 1e4;
w = 10; %controls bias/variance
theta_part =[];

%init
mass = rand(3,1);
mass1 = mass/sum(mass); %normalize to 1
%draw for rho
rho1 = (rand(3,1)*1 +0.0);
offset1 = [0,0]';

llh_stack = zeros(1,num_samp);
stuck = 0;
MAP_sofar = -inf;
for i = 1:num_samp
    
    
    %if stuck, reinit
    if stuck > 2000
        stuck = 0;
        mass = rand(3,1);
        mass1 = mass/sum(mass); %normalize to 1
        %draw for rho
        rho1 = (rand(3,1)*1 +0.0);
    end

    
    %uniform, prior is equal to 1 everywhere
    %draw for masses, gaussian truncated 
    mass2 = randn(3,1)*0.01+mass1;
    mass2(mass2<0.01) = 0.01;
    
    %normalize
    mass2 = mass2/sum(mass2); %normalize to 1

    
    %draw for rho
    rho2 = randn(3,1)*0.01+rho1;
    rho2(rho2<0.01) = 0.01;
    rho2(rho2>0.99) = 0.99;

    
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
    pr1 = sum(log(normpdf(mass1,1/3*[1;1;1],1/4)));
    pr1(pr1<-500) = -500;
    pr2 = sum(log(normpdf(rho1,1/3*[1;1;1],1/8)));
    pr2(pr2<-500) = -500;
    
    %get likelihood
    pred_out1 = A*theta_cand1;
    llh1 = log(normpdf(meas,pred_out1,w));
    %regularize
    llh1(llh1<-500) = -500;
    llh1 = sum(llh1);
    
    pred_out2 = A*theta_cand2;
    llh2 = log(normpdf(meas,pred_out2,w));
    %regularize
    llh2(llh2<-500) = -500;
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
    
    i
end

%% plotting/ comparison

%generate testing data
generateTestData;


%gonzalez
A = [];
%get xy thetas
num_dim = 3;
A = appendMat(A,stack0,stack1,num_dim);
%add identities
I = [eye(2)];
A = [repmat(I,size(A,1)/2,1),A];
%other joints
A = appendMat(A,stack1,stack2,num_dim);
A = appendMat(A,stack2,stack3,num_dim);

obs = CoM(1:2,:)';
est = A*R;
est = vec2mat(est,2);
close all;
figure(1)
subplot(1,2,1)
plot(smooth(obs(:,1),5),'b');
hold on
plot(smooth(est(:,1),5),'r');
legend('Recorded','Estimate');
title('Estimate using Gonzalez: X')


subplot(1,2,2)
plot(smooth(obs(:,2),5),'b');
hold on
plot(smooth(est(:,2),5),'r');
legend('Recorded','Estimate');
title('Estimate using Gonzalez: Y')

% conj prior
%make matrix
A= [];
A = [A, stack0CP, stack1CP-stack0CP];
A = [A, stack1CP, stack2CP-stack1CP];
A = [A, stack2CP, stack3CP-stack2CP];
%add offset
I = eye(2);
A = [repmat(I,size(A,1)/2,1),A];


est = A*theta_Bayes;
est = vec2mat(est,2);
%close all;
figure(2)
subplot(1,2,1)
plot(smooth(obs(:,1),5),'b');
hold on
plot(smooth(est(:,1),5),'r');
legend('Recorded','Estimate');
title('MAP Estimate using Gaussian Prior: X')

subplot(1,2,2)
plot(smooth(obs(:,2),5),'b');
hold on
plot(smooth(est(:,2),5),'r');
legend('Recorded','Estimate');
title('MAP Estimate using Gaussian Prior: Y')


% MCMC
%make matrix
A= [];
A = [A, stack0CP, stack1CP-stack0CP];
A = [A, stack1CP, stack2CP-stack1CP];
A = [A, stack2CP, stack3CP-stack2CP];
%add offset
I = eye(2);
A = [repmat(I,size(A,1)/2,1),A];


est = A*MAP_theta;
est = vec2mat(est,2);
%close all;
figure(3)
subplot(1,2,1)
plot(smooth(obs(:,1),5),'b');
hold on
plot(smooth(est(:,1),5),'r');
legend('Recorded','Estimate');
title('MAP Estimate using MCMC: X')

subplot(1,2,2)
plot(smooth(obs(:,2),5),'b');
hold on
plot(smooth(est(:,2),5),'r');
legend('Recorded','Estimate');
title('MAP Estimate using MCMC: Y')

