function [R, t,deltaX_vehicle_m, deltaY_vehicle_m, deltaYaw_vehicle_deg] = register_point_clouds_icp(point_cloud1, point_cloud2)
    %Reshape the matrices to make them 360x3 instead of 1x360x3
    point_cloud1_reshaped = reshape(point_cloud1, [], 3);
    point_cloud2_reshaped = reshape(point_cloud2, [], 3);

    %Create point cloud objects to hold reshaped and fixed point clouds
    ptCloud1 = pointCloud(point_cloud1_reshaped);
    ptCloud2 = pointCloud(point_cloud2_reshaped);

    % Register point clouds using ICP
    [tform, ~, ~] = pcregistericp(ptCloud1, ptCloud2,'Extrapolate', true);
    %[tform, ~, ~] = pcregistericp(ptCloud1, ptCloud2,Metric='pointToPoint');

    % Extract rotation matrix and translation vector from transformation matrix
    R = tform.T(1:3, 1:3);
    eulerAngles = -rotm2eul(R, 'XYZ');
    deltaYaw_vehicle_deg =  rad2deg(eulerAngles(3));
    t = tform.T(4, 1:3)';
    deltaX_vehicle_m = t(2);
    deltaY_vehicle_m = t(1);

end