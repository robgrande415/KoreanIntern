% this script solves for the mass and rho parameters by assuming that the
% prior density is gaussian and measurements are gaussian. It does not
% guarantee feasible assignments to mass and did not have as good accuracy
% as the MCMC and PF methods, so it was abandoned. 

%least squares
clear all;
close all;

%data preprocessing
filename = 'Dataset2';
preprocess
%delete y dimension
p_alt(:,2:3:end) = [];
%% id for joints

num_dim = 2;
XN_SKEL_HEAD = num_dim*0 +(1:num_dim);
XN_SKEL_NECK = num_dim*1 +(1:num_dim);
XN_SKEL_TORSO = num_dim*2 +(1:num_dim);

XN_SKEL_LEFT_SHOULDER = num_dim*3 +(1:num_dim);
XN_SKEL_LEFT_ELBOW = num_dim*4 +(1:num_dim);
XN_SKEL_LEFT_HAND = num_dim*5 +(1:num_dim);

XN_SKEL_RIGHT_SHOULDER = num_dim*7 +(1:num_dim);
XN_SKEL_RIGHT_ELBOW = num_dim*8 +(1:num_dim);
XN_SKEL_RIGHT_HAND = num_dim*9 +(1:num_dim);

XN_SKEL_LEFT_HIP = num_dim*11 +(1:num_dim);
XN_SKEL_LEFT_KNEE = num_dim*12 +(1:num_dim);
XN_SKEL_LEFT_FOOT = num_dim*13 +(1:num_dim);

XN_SKEL_RIGHT_HIP = num_dim*14 +(1:num_dim);
XN_SKEL_RIGHT_KNEE = num_dim*15 +(1:num_dim);
XN_SKEL_RIGHT_FOOT = num_dim*16 +(1:num_dim);

%collect all data points
XN_SKEL_HEAD_stack = p_alt(:,XN_SKEL_HEAD)';
XN_SKEL_HEAD_stack = XN_SKEL_HEAD_stack(:);
XN_SKEL_NECK_stack = p_alt(:,XN_SKEL_NECK)';
XN_SKEL_NECK_stack = XN_SKEL_NECK_stack(:);
XN_SKEL_TORSO_stack = p_alt(:,XN_SKEL_TORSO)';
XN_SKEL_TORSO_stack = XN_SKEL_TORSO_stack(:);

XN_SKEL_LEFT_SHOULDER_stack = p_alt(:,XN_SKEL_LEFT_SHOULDER)';
XN_SKEL_LEFT_SHOULDER_stack = XN_SKEL_LEFT_SHOULDER_stack(:);
XN_SKEL_LEFT_ELBOW_stack = p_alt(:,XN_SKEL_LEFT_ELBOW)';
XN_SKEL_LEFT_ELBOW_stack = XN_SKEL_LEFT_ELBOW_stack(:);
XN_SKEL_LEFT_HAND_stack = p_alt(:,XN_SKEL_LEFT_HAND)';
XN_SKEL_LEFT_HAND_stack = XN_SKEL_LEFT_HAND_stack(:);

XN_SKEL_RIGHT_SHOULDER_stack = p_alt(:,XN_SKEL_RIGHT_SHOULDER)';
XN_SKEL_RIGHT_SHOULDER_stack = XN_SKEL_RIGHT_SHOULDER_stack(:);
XN_SKEL_RIGHT_ELBOW_stack = p_alt(:,XN_SKEL_RIGHT_ELBOW)';
XN_SKEL_RIGHT_ELBOW_stack = XN_SKEL_RIGHT_ELBOW_stack(:);
XN_SKEL_RIGHT_HAND_stack = p_alt(:,XN_SKEL_RIGHT_HAND)';
XN_SKEL_RIGHT_HAND_stack = XN_SKEL_RIGHT_HAND_stack(:);

XN_SKEL_LEFT_HIP_stack = p_alt(:,XN_SKEL_LEFT_HIP)';
XN_SKEL_LEFT_HIP_stack = XN_SKEL_LEFT_HIP_stack(:);
XN_SKEL_LEFT_KNEE_stack = p_alt(:,XN_SKEL_LEFT_KNEE)';
XN_SKEL_LEFT_KNEE_stack = XN_SKEL_LEFT_KNEE_stack(:);
XN_SKEL_LEFT_FOOT_stack = p_alt(:,XN_SKEL_LEFT_FOOT)';
XN_SKEL_LEFT_FOOT_stack = XN_SKEL_LEFT_FOOT_stack(:);

XN_SKEL_RIGHT_HIP_stack = p_alt(:,XN_SKEL_RIGHT_HIP)';
XN_SKEL_RIGHT_HIP_stack = XN_SKEL_RIGHT_HIP_stack(:);
XN_SKEL_RIGHT_KNEE_stack = p_alt(:,XN_SKEL_RIGHT_KNEE)';
XN_SKEL_RIGHT_KNEE_stack = XN_SKEL_RIGHT_KNEE_stack(:);
XN_SKEL_RIGHT_FOOT_stack = p_alt(:,XN_SKEL_RIGHT_FOOT)';
XN_SKEL_RIGHT_FOOT_stack = XN_SKEL_RIGHT_FOOT_stack(:);

%% design matrix to invert
%{
v.push_back(XN_SKEL_HEAD);1-3 
v.push_back(XN_SKEL_NECK);4-6
v.push_back(XN_SKEL_TORSO);7-9
v.push_back( XN_SKEL_WAIST);000

v.push_back( XN_SKEL_LEFT_COLLAR);000
v.push_back( XN_SKEL_LEFT_SHOULDER);16-18
v.push_back( XN_SKEL_LEFT_ELBOW);19-21
v.push_back( XN_SKEL_LEFT_WRIST);000
v.push_back( XN_SKEL_LEFT_HAND);25-27
v.push_back( XN_SKEL_LEFT_FINGERTIP);000

v.push_back( XN_SKEL_RIGHT_COLLAR);000
v.push_back( XN_SKEL_RIGHT_SHOULDER);34-36
v.push_back( XN_SKEL_RIGHT_ELBOW);37:39
v.push_back( XN_SKEL_RIGHT_WRIST);000
v.push_back( XN_SKEL_RIGHT_HAND);43:45
v.push_back( XN_SKEL_RIGHT_FINGERTIP);000

v.push_back( XN_SKEL_LEFT_HIP); 49:51
v.push_back( XN_SKEL_LEFT_KNEE); 52:54
v.push_back( XN_SKEL_LEFT_ANKLE); 000
v.push_back( XN_SKEL_LEFT_FOOT); 58:60

v.push_back( XN_SKEL_RIGHT_HIP); 61:63
v.push_back( XN_SKEL_RIGHT_KNEE); 64:66
v.push_back( XN_SKEL_RIGHT_ANKLE); 000
v.push_back( XN_SKEL_RIGHT_FOOT); 70:72
%}

A = [];
B = [];

A = [A, XN_SKEL_NECK_stack, XN_SKEL_HEAD_stack-XN_SKEL_NECK_stack];

%A = [A, XN_SKEL_NECK_stack, XN_SKEL_LEFT_SHOULDER_stack-XN_SKEL_NECK_stack];
A = [A, XN_SKEL_LEFT_SHOULDER_stack, XN_SKEL_LEFT_ELBOW_stack - XN_SKEL_LEFT_SHOULDER_stack];
A = [A, XN_SKEL_LEFT_ELBOW_stack, XN_SKEL_LEFT_HAND_stack - XN_SKEL_LEFT_ELBOW_stack];

%A = [A, XN_SKEL_NECK_stack, XN_SKEL_RIGHT_SHOULDER_stack-XN_SKEL_NECK_stack];
A = [A, XN_SKEL_RIGHT_SHOULDER_stack, XN_SKEL_RIGHT_ELBOW_stack - XN_SKEL_RIGHT_SHOULDER_stack];
A = [A, XN_SKEL_RIGHT_ELBOW_stack, XN_SKEL_RIGHT_HAND_stack - XN_SKEL_RIGHT_ELBOW_stack];

A = [A, XN_SKEL_TORSO_stack, XN_SKEL_NECK_stack - XN_SKEL_TORSO_stack];
%A = [A, XN_SKEL_TORSO_stack, XN_SKEL_RIGHT_SHOULDER_stack - XN_SKEL_TORSO_stack];
A = [A, XN_SKEL_TORSO_stack, (XN_SKEL_LEFT_HIP_stack+XN_SKEL_RIGHT_HIP_stack)/2 - XN_SKEL_TORSO_stack];

A = [A, XN_SKEL_LEFT_HIP_stack, XN_SKEL_LEFT_KNEE_stack - XN_SKEL_LEFT_HIP_stack];
A = [A, XN_SKEL_LEFT_KNEE_stack, XN_SKEL_LEFT_FOOT_stack - XN_SKEL_LEFT_KNEE_stack];

%A = [A, XN_SKEL_TORSO_stack, XN_SKEL_RIGHT_HIP_stack - XN_SKEL_TORSO_stack];
A = [A, XN_SKEL_RIGHT_HIP_stack, XN_SKEL_RIGHT_KNEE_stack - XN_SKEL_RIGHT_HIP_stack];
A = [A, XN_SKEL_RIGHT_KNEE_stack, XN_SKEL_RIGHT_FOOT_stack - XN_SKEL_RIGHT_KNEE_stack];

%A = [A, XN_SKEL_LEFT_HIP_stack, XN_SKEL_RIGHT_HIP_stack - XN_SKEL_LEFT_HIP_stack];

%add offset
I = eye(2);
A = [repmat(I,size(A,1)/2,1),A];
%{
DrawLimb(aUsers[i], XN_SKEL_HEAD, XN_SKEL_NECK);

DrawLimb(aUsers[i], XN_SKEL_NECK, XN_SKEL_LEFT_SHOULDER);
DrawLimb(aUsers[i], XN_SKEL_LEFT_SHOULDER, XN_SKEL_LEFT_ELBOW);
DrawLimb(aUsers[i], XN_SKEL_LEFT_ELBOW, XN_SKEL_LEFT_HAND);

DrawLimb(aUsers[i], XN_SKEL_NECK, XN_SKEL_RIGHT_SHOULDER);
DrawLimb(aUsers[i], XN_SKEL_RIGHT_SHOULDER, XN_SKEL_RIGHT_ELBOW);
DrawLimb(aUsers[i], XN_SKEL_RIGHT_ELBOW, XN_SKEL_RIGHT_HAND);

DrawLimb(aUsers[i], XN_SKEL_LEFT_SHOULDER, XN_SKEL_TORSO);
DrawLimb(aUsers[i], XN_SKEL_RIGHT_SHOULDER, XN_SKEL_TORSO);

DrawLimb(aUsers[i], XN_SKEL_TORSO, XN_SKEL_LEFT_HIP);
DrawLimb(aUsers[i], XN_SKEL_LEFT_HIP, XN_SKEL_LEFT_KNEE);
DrawLimb(aUsers[i], XN_SKEL_LEFT_KNEE, XN_SKEL_LEFT_FOOT);

DrawLimb(aUsers[i], XN_SKEL_TORSO, XN_SKEL_RIGHT_HIP);
DrawLimb(aUsers[i], XN_SKEL_RIGHT_HIP, XN_SKEL_RIGHT_KNEE);
DrawLimb(aUsers[i], XN_SKEL_RIGHT_KNEE, XN_SKEL_RIGHT_FOOT);

DrawLimb(aUsers[i], XN_SKEL_LEFT_HIP, XN_SKEL_RIGHT_HIP);
%}

%% stack outputs

meas = q_at_p(:,2:3)';
meas(1,:) = meas(1,:)*-1; %mirror image for camera
meas = meas(:);

%% solve using Bayes LS
getPrior_Educated
theta_Bayes = SigmaP * ((w^-2)*A'*meas + lambda0*mu0);

% plot
%reconstruction error
obs = q_at_p(:,2:3);
est = A*theta_Bayes;
est = vec2mat(est,2);
%close all;
figure(2)
subplot(1,2,1)
plot(smooth(obs(:,1))*-1,'b');
hold on
plot(smooth(est(:,1)),'r');
legend('Recorded','Estimate');
title('MAP Estimate using Gaussian Prior: X')

subplot(1,2,2)
plot(smooth(obs(:,2)),'b');
hold on
plot(smooth(est(:,2)),'r');
legend('Recorded','Estimate');
title('MAP Estimate using Gaussian Prior: Y')

[mass_Bayes, rho_Bayes,colors] = drawSkeleton(theta_Bayes)

