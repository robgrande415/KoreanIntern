function [m,r,p] = drawSkeleton(theta)
% function [m,r,p] = drawSkeleton(theta)
% This function draws a plot of a skeleton with the center of mass
% locations and colors proportional to the mass of each limb
%       INPUT:
%           theta - parameter vector of masses, and masses*rho for each
%           limb
%           
%       OUTPUT:
%           m - mass of each limb
%           r - rho of each limb
    %drawing
    lw = 2;
    ms = 12;
    p = vec2mat(theta,2);
    
    %DELETE BIAS 
    p(1,:) = [];
    m = p(:,1);
    r = p(:,2)./p(:,1);

    
    %create vector of color
    p = zeros(length(m),3);
    %scale
    mm = max(m);
    minm = min(m);
    diff = mm-minm;
    p(:,1) = (m-minm)/diff;
    p(:,3) = 1-(m-minm)/diff;
    
    
    figure
    hold on
    plot([0 0],[0 1],'Color',p(1,:),'LineWidth',lw) %head
    plot(0,r(1),'x','Color',p(1,:),'LineWidth',lw,'MarkerSize',ms)
    
    plot([0 0],[-2 0],'Color',p(6,:),'LineWidth',lw) %torso1
    plot(0,-2+2*r(6),'x','Color',p(6,:),'LineWidth',lw,'MarkerSize',ms)
    
    plot([0 0],[-4 -2],'Color',p(7,:),'LineWidth',lw) %torso2
    plot(0,-2-2*r(7),'x','Color',p(7,:),'LineWidth',lw,'MarkerSize',ms)
    
    plot([-1 1],[0 0],'Color',[0 0 0],'LineWidth',lw) %collar bone
    plot([-1 -1.5],[0 -2],'Color',p(2,:),'LineWidth',lw) %left arm
    plot(-1-0.5*r(2),0-2*r(2),'x','Color',p(2,:),'LineWidth',lw,'MarkerSize',ms)

    plot([-1.5 -1.5],[-2 -4],'Color',p(3,:),'LineWidth',lw) %left arm lower
    plot(-1.5,-2-2*r(3),'x','Color',p(3,:),'LineWidth',lw,'MarkerSize',ms)

    
    
    plot([1 1.5],[0 -2],'Color',p(4,:),'LineWidth',lw) %right arm
    plot(1+0.5*r(4),0-2*r(4),'x','Color',p(4,:),'LineWidth',lw,'MarkerSize',ms)

    plot([1.5 1.5],[-2 -4],'Color',p(5,:),'LineWidth',lw) %right arm lower
    plot(1.5,-2-2*r(5),'x','Color',p(5,:),'LineWidth',lw,'MarkerSize',ms)

    
    
    plot([-0.75 0.75],[-4 -4],'Color',[0 0 0],'LineWidth',lw) %hip bone
    plot([-0.75 -1],[-4 -6],'Color',p(8,:),'LineWidth',lw) %left leg
    plot(-0.75-0.25*r(8),-4-2*r(8),'x','Color',p(8,:),'LineWidth',lw,'MarkerSize',ms)

    plot([-1 -1],[-6 -8.5],'Color',p(9,:),'LineWidth',lw) %left leg
    plot(-1,-6-2.5*r(9),'x','Color',p(9,:),'LineWidth',lw,'MarkerSize',ms)

    
    plot([0.75 1],[-4 -6],'Color',p(10,:),'LineWidth',lw) %right leg
    plot(0.75+0.25*r(10),-4-2*r(10),'x','Color',p(10,:),'LineWidth',lw,'MarkerSize',ms)

    plot([1 1],[-6 -8.5],'Color',p(11,:),'LineWidth',lw) %right leg
    plot(1,-6-2.5*r(11),'x','Color',p(11,:),'LineWidth',lw,'MarkerSize',ms)


    axis([-2.5 2.5 -9 1.5])




end