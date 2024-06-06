%Create a VideoReader object to read the video
videoObjF = VideoReader(file_pathF);
videoObjB = VideoReader(file_pathB);
videoObjR = VideoReader(file_pathR);
videoObjL = VideoReader(file_pathL);

% Create a VideoWriter object to write frames to image files
grayFolderPathF = 'D:\GP-Github\Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution\MonoCamera_based_Localization\MonoCameraF'; 
grayFolderPathB = 'D:\GP-Github\Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution\MonoCamera_based_Localization\MonoCameraB'; 
grayFolderPathR = 'D:\GP-Github\Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution\MonoCamera_based_Localization\MonoCameraR'; 
grayFolderPathL = 'D:\GP-Github\Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution\MonoCamera_based_Localization\MonoCameraL';

% Create the output folder
mkdir(grayFolderPathF);
mkdir(grayFolderPathB);
mkdir(grayFolderPathR);
mkdir(grayFolderPathL);


frameRate = videoObjF.FrameRate;
numFrames = videoObjF.NumFrames;


for frameNumber = 1 : numFrames
    %Read the current frame
    frameF = read(videoObjF, frameNumber);
    frameB = read(videoObjB, frameNumber);
    frameR = read(videoObjR, frameNumber);
    frameL = read(videoObjL, frameNumber);

    %Convert the rgb images to grayscale images
    frameF = rgb2gray(frameF);
    frameB = rgb2gray(frameB);
    frameR = rgb2gray(frameR);
    frameL = rgb2gray(frameL);

    %Construct output file name
    outputFileName = sprintf('frame_%04d.jpg', frameNumber);
    outputFullPathF = fullfile(grayFolderPathF, outputFileName);
    outputFullPathB = fullfile(grayFolderPathB, outputFileName);
    outputFullPathR = fullfile(grayFolderPathR, outputFileName);
    outputFullPathL = fullfile(grayFolderPathL, outputFileName);

    
    %Put the frames in the images files
    imwrite(frameF, outputFullPathF);
    imwrite(frameB, outputFullPathB);
    imwrite(frameR, outputFullPathR);
    imwrite(frameL, outputFullPathL);

end

%List the images in the folder
filesF = dir(fullfile(grayFolderPathF, '*.jpg')); 
filenameF = fullfile(grayFolderPathF, filesF(1).name);
%Read theimage
img = imread(filenameF);
%Get image size 
imageSize = size(img);

% Display message after completion
disp('Frames are stored in the folders');