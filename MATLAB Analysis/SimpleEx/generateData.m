%generates random walk data

%generate parameters from prior
num_links = 3;
m = 1+randn(num_links,1)/4;
m(m<0.05) = 0.05;
rho = 0.5 +randn(num_links,1)/8;

%generate random walk
dt = 1/20;
t = 0:dt:120;
%ang = zeros(3,length(t));
pos1 = zeros(3,length(t));
pos2 = zeros(3,length(t));
pos3 = zeros(3,length(t));
pos1(3,1) = 1;
pos2(3,1) = 1;
pos3(3,1) = 1;
pos1(3,2) = 1;
pos2(3,2) = 1;
pos3(3,2) = 1;

CoM = zeros(2,length(t));
for i = 3:length(t)
    %ang(:,i) = ang(:,i-1) + randn(3,1)/100*3;
    
    %perturb and normalize
    pos1(:,i) = (pos1(:,i-1) + pos1(:,i-2))/2 + randn(3,1)/100*3;
    pos1(:,i) = pos1(:,i)/norm(pos1(:,i));
    
    pos2(:,i) = pos2(:,i-1)/2 + pos2(:,i-2)/2 + randn(3,1)/100*3;
    pos2(:,i) = pos2(:,i)/norm(pos2(:,i));
    
    pos3(:,i) = pos3(:,i-1)/2 + pos3(:,i-2)/2 + randn(3,1)/100*3;
    pos3(:,i) = pos3(:,i)/norm(pos3(:,i));
    
end

%was relative, now make absolute
pos2 = pos2+pos1;
pos3 = pos3+pos2;

%calculate CoM
%corrupt with noise
for i = 1:length(t)
   CoM(:,i) = m(1)*(1-rho(1))*[0;0] + m(1)*rho(1)*pos1(1:2,i) ...
                + m(2)*(1-rho(2))*pos1(1:2,i) + m(2)*rho(2)*pos2(1:2,i) ...
                + m(3)*(1-rho(3))*pos2(1:2,i) + m(3)*rho(3)*pos3(1:2,i);    
end

CoM = CoM + randn(size(CoM))/100;

%make stacks
pos0 = pos1*0;
stack0 = pos0(:);
stack1 = pos1(:);
stack2 = pos2(:);
stack3 = pos3(:);

%make stacks for CP and MCMC
stack0CP = pos0(1:2,:);
stack0CP = stack0CP(:);
stack1CP = pos1(1:2,:);
stack1CP = stack1CP(:);
stack2CP = pos2(1:2,:);
stack2CP = stack2CP(:);
stack3CP = pos3(1:2,:);
stack3CP = stack3CP(:);


