%This Script is used to load setpoints for scene components.
%And to set time sampling
%Load reference path for recorded drive segment
%Loading Ego Vehicle set points
xData   = load('refPosesX.mat');
yData   = load('refPosesY.mat');
yawData = load('refPosesT.mat');
% Set up workspace variables used by model
refPosesX = xData.refPosesX;
refPosesY = yData.refPosesY;
refPosesT = yawData.refPosesT;


%Loading Follower Vehicle set points
xDataFollower   = load('ourfollowerPosesX.mat');
yDataFollower   = load('ourfollowerPosesY.mat');
yawDataFollower = load('ourfollowerPosesT.mat');
% Set up workspace variables used by model
followerPosesX = xDataFollower.followerPosesX;
followerPosesY = yDataFollower.followerPosesY;
followerPosesT = yawDataFollower.followerPosesT;

%Loading Following Vehicle set points
xDataFollowing   = load('ourfollowingPosesX.mat');
yDataFollowing   = load('ourfollowingPosesY.mat');
yawDataFollowing = load('ourfollowingPosesT.mat');
% Set up workspace variables used by model
followingPosesX = xDataFollowing.followingPosesX;
followingPosesY = yDataFollowing.followingPosesY;
followingPosesT = yawDataFollowing.followingPosesT;

%Setting Time sample
Ts = 30/60;
