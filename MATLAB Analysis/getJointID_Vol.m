%this script simply creates a mapping between names of joints and their
%respective indices in the data
%it then sorts the data into respective stacks of each joints time series
%get joint ID for volume analysis
num_dim = 1;
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
