# Autonomous-Vehicle-Localization-Using-Onboard-Sensor-and-HD-Geolocated-Maps-Project-Solution #

![csm_2021_HARRI_Lokalisierung_Bertrandt_15013a9666](https://github.com/Hazem-M-Abdelaziz/Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution/assets/87466265/b1a57157-ddde-49a0-ba18-c606cd8b2596)

## Table of Contents
- [Challenge Overview](#challenge-overview)
- [Aim of this Repo](#aim-of-this-repo)
- [Processing Sequence](#processing-sequence)
- [Repo Hierarchy](#repo-hierarchy)
  - [Getting familiar with toolboxes](#getting-familiar-with-toolboxes)
  - [KITTI Localization](#kitti-localization)
  - [ADT Localization](#adt-localization)

## Challenge Overview ##
Autonomous vehicles are revolutionizing the way the current transportation system works and many companies are investing on this mega-trend technology to secure a share in this market. Researchers and engineers are combining efforts to achieve a full driving automation (Level 5) system that is safe and comfortable for the passengers. Localization is a key component of an autonomous vehicle to enable autonomous driving by processing and fusing sensory data for accurate results and making adaptive models to handle different individual sensors' errors to come up with highly dependable estimates.

## Aim of this Repo. ##
This is our proposed solution repository for Project #20 (Autonomous Vehicle Localization Using Onboard Sensors and HD Geolocated Maps) as a team consisting of two senior Mechatronics Students (Hazem Mohsen - Yousra Adly) - Faculty of Engineering Ain Shams University, Egypt. under the supervision of Prof. Mohammed Ibrahim Awad.
in this repository we discuss a sequence in which we progress from getting started with the challenge and the used toolboxes to evaluating different localization techniques on both [Synthatic scenes provided by ADT & Real-time driving scenarios from KITTI data-set]

## Processing Sequence ##
* Stroing/Loading data (Whether real-time driving data or synthetic data from simulated scene).
* Sensor-Based Localization:
  * IMU: Following an integrator model to obtain pose data.
  * Lidar: Converting to point cloud objects -> Point cloud registration -> referencing to global frame.
  * Mono Camera: Feature Extraction -> Feature matching ->  using (Essential/Fundamental) Matrix to estimate relative pose -> multiplying by scale factor obtained from absolute motion estimated from IMU -> referencing to global frame.
  * GPS: Converting geodetic data from LLA coordinates to ENU coordinates to match with global reference.
* Fusing Sensory data.
* Adding Adaptive layer to fusion (Adjusting frame-based weights according to some different parameters that contributes in the quality of the sensory data to be embedded within fusion filters):
  * GPS weight FIS: Adjusting GPS variances based on posAcc (Position accuracy) and numSats (Number of satellites).
  * Camera weight FIS: Adjusting weights based on average frame intensity.
  * Lidar weight FIS: Adjusting weights based on average point cloud reflectance.
*Evaluating different techniques (Using accuracy score for real-time data with gps and its position accuracy and absolute difference from setpoint in simulated scene data).

## Repo. Hierarchy ##
### Getting familiar with toolboxes
First folder in the Repo. It describes itself as getting familiar with tools in hand and opening up to the toolboxes with some trials as scripts to start working with different block and data.
The aim of this folder is to get used to the ADT and try different block

### KITTI Localization ###
Second folder in the Repo. that includes the work for KITTI dataset with a paper provided by karlsruhe institute of technology to describe the dataset, KITTI_Localization is the live script containing the sequence of processing in some dataset which requires a path for both Synchronized, Unsynced dataset, and directory in which (fuzzy systems, GPS converters, Accuracy score function) exists, it also includes a pdf file saved for certain data-set used.
Fuzzy inference systems used to generate adaptive weight for different sensors (GPS, Lidar, and Camera) used in adaptive filter to adapt with sensory data for some environmental changes.
Accuracy score file used to evaluate different techniques normalized by the position accuracy of the gps data.

### ADT Localization ###
Final folder in the Repo. that includes:
* ADTLocalization Folder (Localization in Normal Weather Conditions and constant GPS Accuracy):
  * ADT_Localization.mlx: MATLAB Live Script for Autonomous Vehicle Localization using IMU, INS, GPS, Camera, and Lidar sensors.
  * ADT_Localization.pdf: PDF document of the ADT_Localization Script including outputs.
  * ADT_SimulinkModel.slx: Simulink Model for an Ego Vehicle in a US City Block Map with IMU, INS, GPS, Camera, and Lidar sensors.
  * ADTOutput.mat: Output workspace of the ADT_Localization Script and ADT_SimulinkModel.
  * variablesInitialization.m: Script for loading vehicle pose, weather conditions, GPS velocity and accuracy, and setting camera and lidar parameters.
  * GPSVelocities.mat: GPS X and Y velocities from IMU output velocity.
  * PcdR.mat: Extracted Lidar Reflectivity output from the Lidar Simulink block.
  * PoseUSCityBlock.mat: Ego vehicle time sampling and pose (X, Y, Yaw).
  * helperFromWorkspace.m: Script for passing position synchronized every sample time into the model.
  * convertVideoToFrames.m: Script for converting camera video into grayscale frames.
  * lla_to_enu.mlx: MATLAB Live Script for converting LLA coordinates into ENU.

