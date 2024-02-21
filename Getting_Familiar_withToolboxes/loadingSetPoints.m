%This Script is used to load setpoints for scene components.
%Load reference path for recorded drive segment
%Loading Ego Vehicle set points
xData   = load('refPosesX.mat');
yData   = load('refPosesY.mat');
yawData = load('refPosesT.mat');

% Set up workspace variables used by model
refPosesX = xData.refPosesX;
refPosesY = yData.refPosesY;
refPosesT = yawData.refPosesT;

