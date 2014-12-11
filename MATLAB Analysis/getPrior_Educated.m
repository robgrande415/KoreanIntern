% define prior density probability function over parameters of body parts
% uses the japanese dataset which is from 5-20 years old see paper for more
% information

masses = zeros(size(A,2)/2-1,1);
rhos = masses;

%define indices of body parts
num = 1;

NECK_HEAD = num*0 +(1:num);

LSHOULDER_LELBOW = num*1 +(1:num);
LELBOW_LHAND = num*2 +(1:num);

RSHOULDER_RELBOW = num*3 +(1:num);
RELBOW_RHAND = num*4 +(1:num);

TORSO_NECK = num*5 +(1:num);
TORSO_HIP = num*6 +(1:num);

LHIP_LKNEE =  num*7 +(1:num);
LKNEE_LFOOT =  num*8 +(1:num);

RHIP_RKNEE =  num*9 +(1:num);
RKNEE_RFOOT =  num*10 +(1:num);

age = 24;
%assign masses
masses(NECK_HEAD) = 0.27881 - 0.02115*age + 0.0005317*age^2;

masses(LSHOULDER_LELBOW) = 0.02344 + 0.000696*age;
masses(LELBOW_LHAND) = 0.0228 + 0.000261*age; %for hand added 0.0088

masses(RSHOULDER_RELBOW) = 0.02344 + 0.000696*age;
masses(RELBOW_RHAND) = 0.0228 + 0.000261*age;

masses(TORSO_NECK) = 0.15837 - 0.00125*age;
masses(TORSO_HIP) = 0.2733 - 0.0*age;

masses(LHIP_LKNEE) = 0.04309 + 0.0088978*age - 0.00027425*age^2;
masses(LKNEE_LFOOT) = 0.03512 + 0.0063207*age - 0.00026119*age^2;

masses(RHIP_RKNEE) = 0.04309 + 0.0088978*age - 0.00027425*age^2;
masses(RKNEE_RFOOT) = 0.03512 + 0.0063207*age - 0.00026119*age^2;

%assign rhos
rhos(NECK_HEAD) = 0.4833 + 0.0025*age;

rhos(LSHOULDER_LELBOW) = 0.557 -0.00028*age;
rhos(LELBOW_LHAND) = (0.561 + 0.0019*age)*(22/30) +8/30*1; %for hand

rhos(RSHOULDER_RELBOW) = 0.557 -0.00028*age;
rhos(RELBOW_RHAND) = (0.561 + 0.0019*age)*(22/30) +8/30*1;

rhos(TORSO_NECK) = 0.5097 + 0.0018*age;
rhos(TORSO_HIP) = (1-0.5097);

rhos(LHIP_LKNEE) =  0.4758 - 0.00115*age;
rhos(LKNEE_LFOOT) =  (0.4526 - 0.003*age)*(38/(38+18)) + 18/(38+18)*1; %for foot

rhos(RHIP_RKNEE) =  0.4758 - 0.00115*age;
rhos(RKNEE_RFOOT) =  (0.4526 - 0.003*age)*(38/(38+18)) + 18/(38+18)*1; %for foot

mu0 = [masses, rhos.*masses];
mu0 = mu0';
mu0 = mu0(:);


%% variance
%define indices of body parts
num = 2;

NECK_HEAD = num*0 +(1:num);

LSHOULDER_LELBOW = num*1 +(1:num);
LELBOW_LHAND = num*2 +(1:num);

RSHOULDER_RELBOW = num*3 +(1:num);
RELBOW_RHAND = num*4 +(1:num);

TORSO_NECK = num*5 +(1:num);
TORSO_HIP = num*6 +(1:num);

LHIP_LKNEE =  num*7 +(1:num);
LKNEE_LFOOT =  num*8 +(1:num);

RHIP_RKNEE =  num*9 +(1:num);
RKNEE_RFOOT =  num*10 +(1:num);

sigVec = zeros(size(A,2)/2,1);

%set variance for stuff
%mass
sigVec(NECK_HEAD(1)) = 0.05^2;

sigVec(LSHOULDER_LELBOW(1)) = 0.05^2;
sigVec(LELBOW_LHAND(1)) = 0.1^2;

sigVec(RSHOULDER_RELBOW(1)) = 0.05^2;
sigVec(RELBOW_RHAND(1)) = 0.1^2;

sigVec(TORSO_NECK(1)) = 0.1^2;
sigVec(TORSO_HIP(1)) = 0.1^2;

sigVec(LHIP_LKNEE(1)) = 0.1^2;
sigVec(LKNEE_LFOOT(1)) = 0.1^2;

sigVec(RHIP_RKNEE(1)) = 0.1^2;
sigVec(RKNEE_RFOOT(1)) = 0.1^2;

%rho
sigVec(NECK_HEAD(2)) = 0.05^2 *0.025^2;

sigVec(LSHOULDER_LELBOW(2)) = 0.05^2 *0.025^2;
sigVec(LELBOW_LHAND(2)) = 0.1^2 *0.025^2;

sigVec(RSHOULDER_RELBOW(2)) = 0.05^2 *0.025^2;
sigVec(RELBOW_RHAND(2)) = 0.1^2 *0.025^2;

sigVec(TORSO_NECK(2)) = 0.1^2 *0.025^2;
sigVec(TORSO_HIP(2)) = 0.1^2 *0.025^2;

sigVec(LHIP_LKNEE(2)) = 0.1^2 *0.025^2;
sigVec(LKNEE_LFOOT(2)) = 0.1^2 *0.025^2;

sigVec(RHIP_RKNEE(2)) = 0.1^2 *0.025^2;
sigVec(RKNEE_RFOOT(2)) = 0.1^2 *0.025^2;


%append for offset
mu0 = [mean(q_at_p(:,2));mean(q_at_p(:,3));mu0];
sigVec = [1;1;sigVec];

%create matrix
sigma0 = diag(sigVec);

%add dependencies requiring left and right are same
symmetry = 0.9; %this controls how firmly symmetry is imposed 1.0 = completely symmetric, 0.0 not at all
sigma0(LSHOULDER_LELBOW(1)+2,RSHOULDER_RELBOW(1)+2) = sigVec(LSHOULDER_LELBOW(1)+2)*symmetry; %for computatation, needs to be PD
sigma0(RSHOULDER_RELBOW(1)+2,LSHOULDER_LELBOW(1)+2) = sigVec(LSHOULDER_LELBOW(1)+2)*symmetry;
sigma0(LELBOW_LHAND(1)+2,RELBOW_RHAND(1)+2) = sigVec(LELBOW_LHAND(1)+2)*symmetry; %for computatation, needs to be PD
sigma0(RELBOW_RHAND(1)+2,LELBOW_LHAND(1)+2) = sigVec(LELBOW_LHAND(1)+2)*symmetry;

sigma0(LHIP_LKNEE(1)+2,RHIP_RKNEE(1)+2) = sigVec(LHIP_LKNEE(1)+2)*symmetry; %for computatation, needs to be PD
sigma0(RHIP_RKNEE(1)+2,LHIP_LKNEE(1)+2) = sigVec(LHIP_LKNEE(1)+2)*symmetry;
sigma0(LKNEE_LFOOT(1)+2,RKNEE_RFOOT(1)+2) = sigVec(LKNEE_LFOOT(1)+2)*symmetry; %for computatation, needs to be PD
sigma0(RKNEE_RFOOT(1)+2,LKNEE_LFOOT(1)+2) = sigVec(LKNEE_LFOOT(1)+2)*symmetry;

sigma0(LSHOULDER_LELBOW(2)+2,RSHOULDER_RELBOW(2)+2) = sigVec(LSHOULDER_LELBOW(2)+2)*symmetry; %for computatation, needs to be PD
sigma0(RSHOULDER_RELBOW(2)+2,LSHOULDER_LELBOW(2)+2) = sigVec(LSHOULDER_LELBOW(2)+2)*symmetry;
sigma0(LELBOW_LHAND(2)+2,RELBOW_RHAND(2)+2) = sigVec(LELBOW_LHAND(2)+2)*symmetry; %for computatation, needs to be PD
sigma0(RELBOW_RHAND(2)+2,LELBOW_LHAND(2)+2) = sigVec(LELBOW_LHAND(2)+2)*symmetry;

sigma0(LHIP_LKNEE(2)+2,RHIP_RKNEE(2)+2) = sigVec(LHIP_LKNEE(2)+2)*symmetry; %for computatation, needs to be PD
sigma0(RHIP_RKNEE(2)+2,LHIP_LKNEE(2)+2) = sigVec(LHIP_LKNEE(2)+2)*symmetry;
sigma0(LKNEE_LFOOT(2)+2,RKNEE_RFOOT(2)+2) = sigVec(LKNEE_LFOOT(2)+2)*symmetry; %for computatation, needs to be PD
sigma0(RKNEE_RFOOT(2)+2,LKNEE_LFOOT(2)+2) = sigVec(LKNEE_LFOOT(2)+2)*symmetry;

%add dependencies between m and rho
sigma0(LSHOULDER_LELBOW(1)+2,LSHOULDER_LELBOW(2)+2) = sigVec(LSHOULDER_LELBOW(2)+2);
sigma0(LSHOULDER_LELBOW(2)+2,LSHOULDER_LELBOW(1)+2) = sigVec(LSHOULDER_LELBOW(2)+2);
sigma0(RSHOULDER_RELBOW(1)+2,RSHOULDER_RELBOW(2)+2) = sigVec(LSHOULDER_LELBOW(2)+2);
sigma0(RSHOULDER_RELBOW(2)+2,RSHOULDER_RELBOW(1)+2) = sigVec(LSHOULDER_LELBOW(2)+2);

sigma0(LELBOW_LHAND(1)+2,LELBOW_LHAND(2)+2) = sigVec(LELBOW_LHAND(2)+2);
sigma0(LELBOW_LHAND(2)+2,LELBOW_LHAND(1)+2) = sigVec(LELBOW_LHAND(2)+2);
sigma0(RELBOW_RHAND(1)+2,RELBOW_RHAND(2)+2) = sigVec(LELBOW_LHAND(2)+2);
sigma0(RELBOW_RHAND(2)+2,RELBOW_RHAND(1)+2) = sigVec(LELBOW_LHAND(2)+2);

sigma0(LHIP_LKNEE(1)+2,LHIP_LKNEE(2)+2) = sigVec(LHIP_LKNEE(2)+2);
sigma0(LHIP_LKNEE(2)+2,LHIP_LKNEE(1)+2) = sigVec(LHIP_LKNEE(2)+2);
sigma0(RHIP_RKNEE(1)+2,RHIP_RKNEE(2)+2) = sigVec(RHIP_RKNEE(2)+2);
sigma0(RHIP_RKNEE(2)+2,RHIP_RKNEE(1)+2) = sigVec(RHIP_RKNEE(2)+2);

sigma0(LKNEE_LFOOT(1)+2,LKNEE_LFOOT(2)+2) = sigVec(LKNEE_LFOOT(2)+2);
sigma0(LKNEE_LFOOT(2)+2,LKNEE_LFOOT(1)+2) = sigVec(LKNEE_LFOOT(2)+2);
sigma0(RKNEE_RFOOT(1)+2,RKNEE_RFOOT(2)+2) = sigVec(RKNEE_RFOOT(2)+2);
sigma0(RKNEE_RFOOT(2)+2,RKNEE_RFOOT(1)+2) = sigVec(RKNEE_RFOOT(2)+2);

%%solve
w = 1; %controls bias/variance
lambda0 = sigma0^-1;
SigmaP = w^2 * (A'*A + (w^2*lambda0))^-1;


%% for MCMC
sigma_mass = 0.05*ones(size(masses));
sigma_rhos = 0.05*ones(size(rhos));

