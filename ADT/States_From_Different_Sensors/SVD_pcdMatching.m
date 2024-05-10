function [R, t] = SVD_pcdMatching(source_points, target_points)
    %This is to convert input data from 1x360x3 to 360x3
    source_points = squeeze(source_points);
    target_points = squeeze(target_points);

    %Replace NaN entries with 0 as pcd Data recorded from simulation gives
    %Nan for points that doesn't exist in points cloud
    source_points(isnan(source_points)) = 0;
    target_points(isnan(target_points)) = 0;

    % Apply very small weights to NaN entries
    source_points_weights = source_points(:,1) ~= 0;
    target_points_weights = target_points(:,1) ~= 0;

    %target_points_weights = 1;
    %target_points_weights(isnan(target_points)) = 0;

    % Apply weights to source and target points
    %%Weighted source points = source points
    weighted_source_points = bsxfun(@times, source_points, source_points_weights);
    weighted_target_points = bsxfun(@times, target_points, target_points_weights);

    % Compute centroids
    source_centroid = sum(weighted_source_points) / sum(source_points_weights);
    target_centroid = sum(weighted_target_points) / sum(target_points_weights);

    % Center the points
    centered_source = bsxfun(@minus, weighted_source_points, source_centroid);
    centered_target = bsxfun(@minus, weighted_target_points, target_centroid);

    % Compute cross-covariance matrix
    H = (centered_source' * centered_target);
    % Singular Value Decomposition
    [U, ~, V] = svd(H);

    % Compute rotation matrix
    R = V * U';

    % Compute translation vector
    t = target_centroid' - R * source_centroid';
end