# Autonomous-Vehicle-Localization-Using-Onboard-Sensor-and-HD-Geolocated-Maps-Project-Solution #

![csm_2021_HARRI_Lokalisierung_Bertrandt_15013a9666](https://github.com/Hazem-M-Abdelaziz/Autonomous-Vehicle-Localization-Using-Onboars-Sensor-and-HD-Geolocated-Maps-Project-Solution/assets/87466265/b1a57157-ddde-49a0-ba18-c606cd8b2596)

<details>
  <summary><h2 style="display: inline;">Table of content</h2></summary>
  
- [Challenge Overview](#challenge-overview)
- [Aim of Repository](#aim-of-repository)
- [Processing Sequence](#processing-sequence)
- [Repository Hierarchy](#repository-hierarchy)
  - [Getting familiar with toolboxes](#getting-familiar-with-toolboxes)
  - [KITTI Localization](#kitti-localization)
  - [ADT Localization](#adt-localization)
- [Processing with Linux-based systems](#Processing-with-Linux-based-systems)
- [Future Work](#Future-Work)
- [References](#references)
- [Contacts](#contacts)

</details>



## Challenge Overview 🎯
Autonomous vehicles are revolutionizing the way the current transportation system works and many companies are investing on this mega-trend technology to secure a share in this market. Researchers and engineers are combining efforts to achieve a full driving automation (Level 5) system that is safe and comfortable for the passengers. Localization is a key component of an autonomous vehicle to enable autonomous driving by processing and fusing sensory data for accurate results and making adaptive models to handle different individual sensors' errors to come up with highly dependable estimates.

## Aim of Repository 📈
This is our proposed solution repository for Project #20 (Autonomous Vehicle Localization Using Onboard Sensors and HD Geolocated Maps) as a team consisting of two senior Mechatronics Students (Hazem Mohsen - Yousra Adly) - Faculty of Engineering Ain Shams University, Egypt. under the supervision of Prof. Mohammed Ibrahim Awad.
in this repository we discuss a sequence in which we progress from getting started with the challenge and the used toolboxes to evaluating different localization techniques on both [Synthatic scenes provided by ADT & Real-time driving scenarios from KITTI data-set]
For more information, you can refer to our video ⭐ **[Project Workflow Video](https://youtu.be/tMXQNJMVf2g)**.

## Processing Sequence ⛓️
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

## Repository Hierarchy 📁
### Getting familiar with toolboxes
📂 This folder describes itself as getting familiar with tools in hand and opening up to the toolboxes with some trials as scripts to start working with different blocks and data.
The aim of this folder is to get used to the ADT and try different Sensors with their dependency Simulink blocks.
<details>
<summary><strong> This comprises: </strong></summary>
  
  - Sensor_Fusion:
    - Average_Estimation_SensorFusion.mlx: live script for getting average estimates between given data. 
    - SensorFusion.mlx: live script for different fusion techniques together (Average-Weighted average-KF).
    - StandardKalmanFilter.mlx: live script for getting Kalman Filter estimates between given data.
    - WeightedSumEstimation.mlx: live script for getting weighted average estimates between given data.
  - Sensor_States:
    - GPSSensorStates:
      - GPSBasedLocalization.mlx: live script for GPS-Based Localization sequence.
      - GPSModel.slx: Simulink model contains GPS-Based Localization blocks.
    - MonoCameraSensorStates:
      - CameraLoc.mlx: live script for Camera-Based Localization sequence.
      - CameraLoc.pdf: document containing CameraLoc script data and output.
      - cameraModel.slx: Simulink model contains Camera-Based Localization blocks.
      - convertVideoToFrames.m: script for a function converting video captured to frames.
      - variablesInitialization.m: script for a function to initialize parameters data.
    - IMU_INS_States.slx: Simulink model contains IMU-Based Localization blocks.
    - VisualizePointCloud.m: script for a function to visualize point cloud data.
    - lidarBasedLocalization.mlx:  live script for Lidar-Based Localization sequence.
    - lidarStates.slx: Simulink model contains Lidar-Based Localization blocks.
    - register_point_clouds_icp.m: script for a function performing PCD matching between two frames based on ICP algorithm.
    - sceneElements.slx: Simulink model used to test and change some of the ADT scene elements.
    - (Setpoints mat files): mat files contains three vehicle trajectory set points following the same path.
</details>

### KITTI Localization ###
📂 The work for KITTI dataset provided by karlsruhe institute of technology, Germany, this folder includes Localization problem solution for datasets.
<details>
<summary><strong> This comprises: </strong></summary>
  
  - IJRR_laper.pdf: Pdf file provided by karlsurhe institute of technology to describe the content of dataset and more details about sensors and transformation.
  - KITTI_Localization.mlx: Live script includes the Localization sequence for given dataset that requires path to both synced/unsynced dataset as well as folder including fuzzy systems and gps converter scripts.
  - KITTI_Localization.pdf: Document with results and graphs for certain dataset as a sample.
  - accuracyScore.mlx: Script includes function for evaluation based on gps data and its position accuracy that takes model path, gps path, gps accuracy and returns accuracy score normalized with the accuracy of the gps.
  - camWeights_FIS.mlx: Script includes fuzzy inference system tuned to handle data from real-time driving scenario images and returns weights of the camera data representing dependency of its data according to the scene average intensity.
  - en_to_ll.mlx: Script includes function that converts back East/North coordinates of ENU reference frame used to geodetic LLA Coordinates Longitude/Latitude.
  - gpsWeights_FIS.mlx: Script includes fuzzy inference system tuned to handle data from real-time driving scenario gps data and returns weights of the gps data representing dependency of its data according to the data position accuracy as well as number of satellites.
  - lidarWeights_FIS.mlx: Script includes fuzzy inference system tuned to handle data from real-time driving scenario point cloud data and returns weights of the lidar data representing dependency of its data according to the scene average reflectance.
  - lla_to_enu.mlx: Script includes function to convert from Geodetic LLA coordinates frame to local ENU frame
</details>

### ADT Localization ###
📂 In this directory, files relevant to Autonomous Vehicle localization in US City Block Map using MATLAB toolboxes and Unreal Engine-based simulator in ADT to achieve high precision Localization.

<details>
<summary><strong> This comprises: </strong></summary>
  
  - ADT_Localization.mlx: MATLAB Live Script facilitating vehicle localization using a combination of IMU, INS, GPS, camera, and LiDAR sensors.
  - ADT_Localization.pdf: A PDF document presenting the content of the ADT_Localization script along with its outputs.
  - ADT_SimulinkModel.slx: Simulink model illustrating an ego vehicle's dynamics within a US city block map, integrating IMU, INS, GPS, camera, and LiDAR sensors.
  - variablesInitialization.m: Script facilitating the initialization of vehicle pose, weather conditions, GPS velocity and accuracy, as well as the configuration of camera and LiDAR parameters.
  - GPSVelocities.mat: Dataset containing GPS velocities in the X and Y directions derived from IMU output velocity.
  - UsCityBlockPose.mat: Dataset containing ego vehicle's temporal sampling and pose data (X, Y, Yaw) within a US city block.
  - detectAndMatchFeatures.m: Function for detecting and matching camera features using different functions.
  - estimateMatrix.m: Function for applying esstential or fundamental matrices using inliers points.
  - estimateRelativePose.m: Function to calculate the estimated camera pose. 
  - convertVideoToFrames.m: Script facilitating the conversion of camera video into grayscale frames.
  - lla_to_enu.mlx: MATLAB Live Script enabling the conversion of Latitude, Longitude, and Altitude (LLA) coordinates into East, North, Up (ENU) coordinates.
</details>

## Processing with Linux-based systems ❗
When working with Linux-based systems, some changes are required to operate correctly without any errors, when referring to some paths using '/' instead of '\\', for example:

Using: _grayFolderPath = strcat(dataset_path, '/image_00/data');_ ✔️

Instead of: _grayFolderPath = strcat(dataset_path, '\image_00\data');_ ✖️

## Future Work
Improving camera Pose Estimation through getting the scale factor from a Fuzzy logic system depending on sensors (LiDAR - GPS - IMU) pose output. 

## References 🌐
1. [A Survey of 3D LiDAR and Camera Fusion Techniques for Autonomous Driving](https://arxiv.org/abs/1711.05805) 
2. [State Estimation for Robotics](http://asrl.utias.utoronto.ca/~tdb/bib/barfoot_ser17.pdf) 
3. [Kalman Filtering: Theory and Practice Using MATLAB](https://www.researchgate.net/publication/243786641_Kalman_filtering_theory_and_practice_using_MATLAB)
4. [Probabilistic Robotics](https://docs.ufpr.br/~danielsantos/ProbabilisticRobotics.pdf)
5. [Automated Driving Toolbox Documentation](https://www.mathworks.com/help/driving/)
6. [Fuzzy Logic Toolbox Documentation](https://www.mathworks.com/help/fuzzy/)
7. [Computer Vision Toolbox Documentation](https://www.mathworks.com/help/vision/)
8. [Prof. Cyrill Stachniss Youtube channel](https://www.youtube.com/@CyrillStachniss).


## Contacts 📧

<table>
  <tr>
    <td>Hazem Mohsen:</td>
    <td>
      <a href="https://www.linkedin.com/in/hazem-mohsen-739b14245/" target="_blank" style="text-decoration: none; display: inline-block;">
        <img src="https://img.shields.io/badge/LinkedIn-informational?style=flat&logo=linkedin&logoColor=white&color=0077B5" alt="LinkedIn">
      </a><a href="mailto:1900973@eng.asu.edu.eg" target="_blank" style="text-decoration: none; display: inline-block;">
        <img src="https://img.shields.io/badge/Outlook-red?style=flat&logo=microsoft-outlook&logoColor=white" alt="Outlook">
      </a>
    </td>
  </tr>
  <tr>
    <td>Yousra Adly:</td>
    <td>
      <a href="https://linkedin.com/in/yousra-adly-7a0905238" target="_blank" style="text-decoration: none; display: inline-block;">
        <img src="https://img.shields.io/badge/LinkedIn-informational?style=flat&logo=linkedin&logoColor=white&color=0077B5" alt="LinkedIn">
      </a><a href="mailto:yousra.adly17@gmail.com" target="_blank" style="text-decoration: none; display: inline-block;">
        <img src="https://img.shields.io/badge/Gmail-red?style=flat&logo=gmail&logoColor=white" alt="Gmail">
      </a>
    </td>
  </tr>
</table>


