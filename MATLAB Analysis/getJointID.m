%this script simply creates a mapping between names of joints and their
%respective indices in the data
%it then sorts the data into respective stacks of each joints time series

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