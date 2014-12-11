function [A, theta, psi] = appendMat(Ain,stack1,stack2,num_dim)

%get angles
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