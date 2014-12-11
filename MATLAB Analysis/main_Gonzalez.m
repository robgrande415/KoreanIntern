% This script implements the Gonzalez wii-kinect algorithm for determining
% CoM from visual information

%least squares
clear all;
close all;

%data preprocessing
filename = 'Subj6_2';
preprocess

%% id for joints
num_dim = 3;
getJointID
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

%% design transformation matrices.
A = [];
%get xy thetas

%head-neck
A = appendMat(A,XN_SKEL_NECK_stack,XN_SKEL_HEAD_stack,num_dim);

%add identities
I = [eye(2)];
A = [repmat(I,size(A,1)/2,1),A];

%other joints
%A = appendMat(A,XN_SKEL_NECK_stack,XN_SKEL_LEFT_SHOULDER_stack,num_dim);
A = appendMat(A,XN_SKEL_LEFT_SHOULDER_stack,XN_SKEL_LEFT_ELBOW_stack,num_dim);
A = appendMat(A,XN_SKEL_LEFT_ELBOW_stack,XN_SKEL_LEFT_HAND_stack,num_dim);

%A = appendMat(A,XN_SKEL_NECK_stack,XN_SKEL_RIGHT_SHOULDER_stack,num_dim);
A = appendMat(A,XN_SKEL_RIGHT_SHOULDER_stack,XN_SKEL_RIGHT_ELBOW_stack,num_dim);
A = appendMat(A,XN_SKEL_RIGHT_ELBOW_stack,XN_SKEL_RIGHT_HAND_stack,num_dim);

%A = appendMat(A,XN_SKEL_TORSO_stack,XN_SKEL_LEFT_SHOULDER_stack,num_dim);
A = appendMat(A,XN_SKEL_TORSO_stack,XN_SKEL_NECK_stack,num_dim);
%A = appendMat(A,XN_SKEL_TORSO_stack,XN_SKEL_RIGHT_SHOULDER_stack,num_dim);
A = appendMat(A,(XN_SKEL_LEFT_HIP_stack+XN_SKEL_RIGHT_HIP_stack)/2,XN_SKEL_TORSO_stack,num_dim);

%A = appendMat(A,XN_SKEL_TORSO_stack,XN_SKEL_LEFT_HIP_stack,num_dim);
A = appendMat(A,XN_SKEL_LEFT_HIP_stack,XN_SKEL_LEFT_KNEE_stack,num_dim);
A = appendMat(A,XN_SKEL_LEFT_KNEE_stack,XN_SKEL_LEFT_FOOT_stack,num_dim);

%A = appendMat(A,XN_SKEL_TORSO_stack,XN_SKEL_RIGHT_HIP_stack,num_dim);
A = appendMat(A,XN_SKEL_RIGHT_HIP_stack,XN_SKEL_RIGHT_KNEE_stack,num_dim);
A = appendMat(A,XN_SKEL_RIGHT_KNEE_stack,XN_SKEL_RIGHT_FOOT_stack,num_dim);

%A = appendMat(A,XN_SKEL_LEFT_HIP_stack,XN_SKEL_RIGHT_HIP_stack,num_dim);

%% stack outputs

meas = q_at_p(:,2:3)';
meas(1,:) = meas(1,:)*-1; %mirror image for camera
meas = meas(:);

%% solve using LS
R = A\meas;

%% plot
%reconstruction error
obs = q_at_p(:,2:3);
obs(:,1) = obs(:,1)*-1;
est = A*R;
est = vec2mat(est,2);
lw = 1.4;
fs = 15;
h=figure;
subplot(2,1,1)
plot(tp,smooth(obs(:,1)),'b','LineWidth',lw);
hold on
plot(tp,smooth(est(:,1)),'r--','LineWidth',lw);
legend('Recorded','Estimate');
title('X CoM Prediction using SESC','FontSize',fs)
axis tight
ylabel('X CoM position (mm)','FontSize',fs)
xlabel('Time (s)','FontSize',fs)
set(gca,'FontSize',fs)

subplot(2,1,2)
plot(tp,smooth(obs(:,2)),'b','LineWidth',lw);
hold on
plot(tp,smooth(est(:,2)),'r--','LineWidth',lw);
title('Y CoM Prediction using SESC','FontSize',fs)
axis tight 
ylabel('Y CoM position (mm)','FontSize',fs)
xlabel('Time (s)','FontSize',fs)
set(gca,'FontSize',fs)
RMSE = sum(mean(abs(est-obs)))


