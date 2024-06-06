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

%Set camera param and videa file path
%Mono_cameras parameters
fx = 1109; %Focal length in x-coordinate 
fy = 1109; %Focal length in y-coordinate 
cx = 640; %Principal point x-coordinate 
cy = 360; %principal point y-coordinate 

%Define file path of the videos
file_pathF = 'D:\GP-Github\Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution\MonoCamera_based_Localization\Video\monoF.avi';
file_pathB = 'D:\GP-Github\Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution\MonoCamera_based_Localization\Video\monoB.avi';
file_pathR = 'D:\GP-Github\Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution\MonoCamera_based_Localization\Video\monoR.avi';
file_pathL = 'D:\GP-Github\Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution\MonoCamera_based_Localization\Video\monoL.avi';

%Set the names of the videos in the Simulink model
set_param('cameraModel/VFront', 'Filename', file_pathF);
set_param('cameraModel/VBack', 'Filename', file_pathB);
set_param('cameraModel/VRight', 'Filename', file_pathR);
set_param('cameraModel/VLeft', 'Filename', file_pathL);