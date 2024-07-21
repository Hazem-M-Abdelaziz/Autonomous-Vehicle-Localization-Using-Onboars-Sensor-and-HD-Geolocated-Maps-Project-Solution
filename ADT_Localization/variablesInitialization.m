%This Script is used to load setpoints for scene components.
%And to set time sampling
%Load reference path for recorded drive segment
%Loading Ego Vehicle set points
%Load vechile path 
load ('UsCityBlockPose.mat');
load ('GPSVelocities.mat');

%Get the data of X, Y and Yaw
refX = UsCityBlockPose(:,1);
refY = UsCityBlockPose(:,2);
refYaw = UsCityBlockPose(:,3);
timeVector = UsCityBlockPose(:,4); 

refPosesX = [timeVector, refX];
refPosesY = [timeVector, refY];
refPosesYaw = [timeVector, refYaw];

%% 
%Set Sampling Time & inital Poses
Ts = timeVector(3) - timeVector(2);
%% 
%Setting up lidar parameters
Vfov= 15;
Vres = 0.1;
Hfov = 360;
Hres = 0.1;
%% 
%Set Mono_cameras parameters
fx = 1109; %Focal length in x-coordinate 
fy = 1109; %Focal length in y-coordinate 
cx = 640; %Principal point x-coordinate 
cy = 360; %principal point y-coordinate 

%Define file path of the videos
% Create the output folder
% Define the folder name
folderName = 'CamVideos';

% Check if the folder already exists
if ~exist(folderName, 'dir')
    % If the folder does not exist, create it
    mkdir(folderName);
end

% Your code to create and save videos goes here
% For example:
file_pathF = fullfile(folderName, 'monoF.avi');

%Set the names of the videos in the Simulink model
set_param('ADT_SimulinkModel/VFront', 'Filename', file_pathF);