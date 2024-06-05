# Autonomous-Vehicle-Localization-Using-Onboard-Sensor-and-HD-Geolocated-Maps-Project-Solution. #
## Challenge Overview. ##
![csm_2021_HARRI_Lokalisierung_Bertrandt_15013a9666](https://github.com/Hazem-M-Abdelaziz/Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution/assets/87466265/b1a57157-ddde-49a0-ba18-c606cd8b2596)

Autonomous vehicles are revolutionizing the way the current transportation system works and many companies are investing on this mega-trend technology to secure a share in this market. Researchers and engineers are combining efforts to achieve a full driving automation (Level 5) system that is safe and comfortable for the passengers. Localization is a key component of an autonomous vehicle to enable autonomous driving by processing and fusing sensory data for accurate results and making adaptive models to handle different individual sensors' errors to come up with highly dependable estimates.

## Aim of this Repo. ##
This is our proposed solution repository for Project #20 (Autonomous Vehicle Localization Using Onboard Sensors and HD Geolocated Maps) as a team consisting of two senior Mechatronics Students (Hazem Mohsen - Yousra Adly) - Faculty of Engineering Ain Shams University, Egypt. under the supervision of Prof. Mohammed Ibrahim Awad.
in this repository we discuss a sequence in which we progress from getting started with the challenge and the used toolboxes to evaluating different localization techniques on both [Synthatic scenes provided by ADT & Real-time driving scenarios from KITTI data-set]

## Processing Sequence. ##
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

## Repo. Hierarchy. ##
### Getting familiar with toolboxes
First folder of the Repo. It describes itself as getting familiar with tools in hand and opening up to the toolboxes with some trials as scripts to start working with different block and data.
The aim of this folder is to get used to the ADT and try different block

### KITTI ###
Second folder of the Repo. that includes the work for KITTI dataset with a paper provided by karlsruhe institute of technology to describe the dataset, KITTI_Localization is the live script containing the sequence of processing in some dataset which requires a path for both Synchronized, Unsynced dataset, and directory in which (fuzzy systems, GPS converters, Accuracy score function) exists, it also includes a pdf file saved for certain data-set used.
Fuzzy inference systems used to generate adaptive weight for different sensors (GPS, Lidar, and Camera) used in adaptive filter to adapt with sensory data for some environmental changes.
Accuracy score file used to evaluate different techniques normalized by the position accuracy of the gps data.

### ADT ###
Third and final folder of the Repo. that includes a 3 vehicles set-point (Ego Vehicle - Following Vehicle - Follower Vehicle) following same path as well as sensor-based Localization model for single sensor Localization using matlab scripts and simulink as well as separated files to handle point cloud (Registration and Matching), and for the fusion folder it contains seperate fusion methods used (Non-adaptive).
the aim of this folder is to dive deep into using tools and skills obtianed from the first folder to create full scenes and test Sensor-based localization and combining data in different fusion techniques.


