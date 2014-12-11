function [A, theta, psi] = appendMat(Ain,stack1,stack2,num_dim)
% function [A, theta, psi] = appendMat(Ain,stack1,stack2,num_dim)
% This function is used to create the matrix required for LS estimation
% using the gonzalez wii-kinect algorithm.
%       INPUT:
%           Ain - matrix to be added to
%           stack1 - vector of joint positions for joint 1
%           stack2 - vector of joint positions for joint 2
%           num_dim - dimensionality of space (2d vs. 3d)
%       OUTPUT:
%           A - appended matrix
%           theta - yaw angle
%           psi - pitch angle 
%
theta = atan2(stack2(2:num_dim:end)-stack1(2:num_dim:end),stack2(1:num_dim:end)-stack1(1:num_dim:end) );
psi = atan2(stack2(3:num_dim:end)-stack1(3:num_dim:end),stack2(1:num_dim:end)-stack1(1:num_dim:end) );

B = [];
for i = 1:length(theta)
    %create individual rotation matrices
    R1 = [cos(theta(i)) -sin(theta(i)) 0; sin(theta(i)) cos(theta(i)) 0; 0 0 1];
    R2 = [cos(psi(i)) 0 -sin(psi(i)); 0 1 0; sin(psi(i)) 0 cos(psi(i))];
    R = R1*R2;
    B = [B; R(1:2,:)];
    
end
A = [Ain, B];
            




end