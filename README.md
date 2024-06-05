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

</details>



## Challenge Overview ##
Autonomous vehicles are revolutionizing the way the current transportation system works and many companies are investing on this mega-trend technology to secure a share in this market. Researchers and engineers are combining efforts to achieve a full driving automation (Level 5) system that is safe and comfortable for the passengers. Localization is a key component of an autonomous vehicle to enable autonomous driving by processing and fusing sensory data for accurate results and making adaptive models to handle different individual sensors' errors to come up with highly dependable estimates.

## Aim of Repository ##
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

## Repository Hierarchy ##
### Getting familiar with toolboxes
This folder describes itself as getting familiar with tools in hand and opening up to the toolboxes with some trials as scripts to start working with different blocks and data.
The aim of this folder is to get used to the ADT and try different Sensors with their dependency Simulink blocks.

### KITTI Localization ###
It includes the work for KITTI dataset with a paper provided by karlsruhe institute of technology to describe the dataset, KITTI_Localization is the live script containing the sequence of processing in some dataset which requires a path for both Synchronized, Unsynced dataset, and directory in which (fuzzy systems, GPS converters, Accuracy score function) exists, it also includes a pdf file saved for certain data-set used.
Fuzzy inference systems used to generate adaptive weight for different sensors (GPS, Lidar, and Camera) used in adaptive filter to adapt with sensory data for some environmental changes.
Accuracy score file used to evaluate different techniques normalized by the position accuracy of the gps data.

### ADT Localization ###
In this directory, files relevant to Autonomous Vehicle localization in US City Block Map using MATLAB toolboxes and Unreal Engine-based simulator in ADT to achieve high precision Localization: 

<details>
<summary><strong> This comprises: </strong></summary>
  
  - ADT_Localization.mlx: MATLAB Live Script facilitating vehicle localization using a combination of IMU, INS, GPS, camera, and LiDAR sensors.
  - ADT_Localization.pdf: A PDF document presenting the content of the ADT_Localization script along with its outputs.
  - ADT_SimulinkModel.slx: Simulink model illustrating an ego vehicle's dynamics within a US city block map, integrating IMU, INS, GPS, camera, and LiDAR sensors.
  - ADTOutput.mat: Workspace file capturing the outputs generated by the ADT_Localization script and ADT_SimulinkModel.
  - variablesInitialization.m: Script facilitating the initialization of vehicle pose, weather conditions, GPS velocity and accuracy, as well as the configuration of camera and LiDAR parameters.
  - GPSVelocities.mat: Dataset containing GPS velocities in the X and Y directions derived from IMU output velocity.
  - PcdR.mat: Dataset comprising extracted LiDAR reflectivity output from the LiDAR Simulink block.
  - PoseUSCityBlock.mat: Dataset containing ego vehicle's temporal sampling and pose data (X, Y, Yaw) within a US city block.
  - helperFromWorkspace.m: Script designed for passing synchronized positional data into the model at every sample time.
  - convertVideoToFrames.m: Script facilitating the conversion of camera video into grayscale frames.
  - lla_to_enu.mlx: MATLAB Live Script enabling the conversion of Latitude, Longitude, and Altitude (LLA) coordinates into East, North, Up (ENU) coordinates.
</details>

# Contact

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


