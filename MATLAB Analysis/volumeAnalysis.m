%this script estimates the mass and rho of each limb by using a volume
%based approach.

close all;
clear all;

%load data
%filename = 'data/1416481836Dep.txt';
filename = 'data/1418201060Dep.txt';

fid = fopen(filename);

%this loads all of the player pixels for a given picture, the user is then
%prompted to either analyze the picture, or look at the next image.
times = [];
pix = [];
while 1
    temp = fscanf(fid,'%d,%d',2);
    if length(temp) == 1
        times = [times,temp];
    elseif length(temp) == 2
        pix = [pix;temp'];
    else
        break;
    end
    
    if length(times) > 1
        pix(:,1) = 480 - pix(:,1);
        scatter(pix(:,2),pix(:,1))
        usr = input('Enter 1 to analyze, and 0 to continue to next image: ');
        if usr == 1
            break;
        else
            times = [];
            pix = [];
            close all;
        end
    end
    
    
    
end

%load joint information
%joint_fn = 'data/1416481836Kin.txt';
joint_fn = 'data/1418201060Kin.txt';

joints = load(joint_fn);
%find joint positions registered by the kinect closest to picture in time
times = times(1);
joint_times = joints(:,end);
ind = find(joint_times>times,1,'first'); %get closest time after
joints = joints(ind,1:end-1);
joints = reshape(joints,[2 17])';
joints(:,2) = 480-joints(:,2);
joints = fliplr(joints); %because Kinect returns y,x, not x,y
getJointID_Vol
%add middle hip joint
joints = [joints; 1/2*joints(XN_SKEL_RIGHT_HIP,:)+1/2*joints(XN_SKEL_LEFT_HIP,:)];
XN_SKEL_CENTER_HIP = 18;
%plot joints
hold on
scatter(joints(:,2),joints(:,1),'r')

%% analysis

%plot search regions
id1 = [XN_SKEL_HEAD,XN_SKEL_LEFT_ELBOW,XN_SKEL_LEFT_HAND,XN_SKEL_RIGHT_ELBOW,XN_SKEL_RIGHT_HAND,XN_SKEL_LEFT_KNEE,XN_SKEL_LEFT_FOOT,XN_SKEL_RIGHT_KNEE,XN_SKEL_RIGHT_FOOT,XN_SKEL_NECK,XN_SKEL_TORSO];
id2 = [XN_SKEL_NECK,XN_SKEL_LEFT_SHOULDER,XN_SKEL_LEFT_ELBOW,XN_SKEL_RIGHT_SHOULDER,XN_SKEL_RIGHT_ELBOW,XN_SKEL_LEFT_HIP,XN_SKEL_LEFT_KNEE,XN_SKEL_RIGHT_HIP,XN_SKEL_RIGHT_KNEE,XN_SKEL_TORSO,XN_SKEL_CENTER_HIP];

%basically, this loop prompts the user to select an area that encloses the
%segment of interest. It then counts the number of pixels enclosed in the
%polygon.
counter = zeros(1,length(id1));
CoM = zeros(2,length(id1));
for k = 1:length(id1)
    hold on
    scatter(joints(:,2),joints(:,1),'r')
    scatter(joints([id1(k) id2(k)],2),joints([id1(k) id2(k)],1),'y')
    disp('Click 4 points to contain region in yellow')
    [usery,userx] = ginput(4);
    userx = [userx;userx(1)];
    usery = [usery;usery(1)];
    userxy = [userx,usery];
    plot(usery,userx,'y')
    
    
    %get number of pixels contained in shape
    % loose boundary of polygon for fast computation
    minxy = min(userxy);
    maxxy = max(userxy);

    for i = 1:length(pix)
        
        %if we are lower than the region, stop
        if pix(i,1) < minxy(1)
            break;
        end

        %fast loose check
        if sum( ((pix(i,:)-maxxy) > 0) ) > 0
        elseif sum( ((pix(i,:)-minxy) < 0) ) > 0
        else
            
            %checks winding number
            temp = userxy - repmat(pix(i,:),size(userxy,1),1);
            temp2 = temp(2:end,:);
            temp(end,:) = [];
            dd =dot(temp',temp2');
            nn = sqrt(sum(temp'.^2)) .* sqrt(sum(temp2'.^2));
            angles = acos(dd./nn);
            angles = sum(angles);
            %point is inside
            if abs(angles-2*pi) < 1e-3
                counter(k) = counter(k)+1;
                CoM(:,k) = CoM(:,k) + pix(i,:)';
            end

        end
    end
    CoM(:,k) = CoM(:,k)/(counter(k));
    scatter(CoM(2,k),CoM(1,k),'g');
    pause(0.01)
end
%percentage of volume
vol_per = counter/sum(counter);

%projection onto limb
for k = 1:length(id1)
    vec1 = joints(id1(k),:)-joints(id2(k),:);
    vec2 = CoM(:,k)'- joints(id2(k),:);
    vec2 = vec2/norm(vec1);
    vec1 = vec1/norm(vec1);
    rho_approx(k) = dot(vec1,vec2);
end
vol_per
rho_approx

save('data/1416481836Dep')

% distributions from paper
%m (mean, variance) r (mean, variance)
%Head+Neck (0:0775;0:052) (0:5344;0:052)
%Upper Torso (0:1284;0:052) (0:5529;0:052)
%Lower Torso (0:7233;0:052) (0:4903;0:052)
%Upper Arm (0:0401;0:052) (0:5503;0:052)
%Lower Arm+Hand (0:0291;0:052) (0:7115;0:052)
%Upper Leg (0:0987;0:052) (0:4482;0:052)
%Lower Leg+Foot (0:0364;0:052) (0:5797;0:052)

