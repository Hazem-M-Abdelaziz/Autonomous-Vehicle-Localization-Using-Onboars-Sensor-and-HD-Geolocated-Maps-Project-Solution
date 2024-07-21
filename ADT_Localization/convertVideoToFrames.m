%Create a VideoReader object to read the video
videoObjF = VideoReader(file_pathF);

% Create the output folder
mkdir('MonoCameraGray');

numFrames = videoObjF.NumFrames;

for frameNumber = 1 : numFrames
    %Read the current frame
    frameF = read(videoObjF, frameNumber);

    %Convert the rgb images to grayscale images
    frameF = rgb2gray(frameF);

    %Construct output file name
    outputFileName = sprintf('frame_%04d.jpg', frameNumber);
    outputFullPathF = fullfile('MonoCameraGray', outputFileName);
    
    %Put the frames in the images files
    imwrite(frameF, outputFullPathF);

end
%% 

%Read the images
img = imread(outputFullPathF);

%Get image size 
imageSize = size(img);

%Get Frame Rate
frameRate = videoObjF.FrameRate;

% Display message after completion
disp('Frames are stored in the folder');