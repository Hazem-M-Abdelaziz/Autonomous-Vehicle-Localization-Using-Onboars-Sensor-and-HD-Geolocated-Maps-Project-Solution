function [relPose, translation, rotation] = estimateRelativePose(matrix, cameraParams, inlierPoints1, inlierPoints2)
    relPose = estrelpose(matrix, cameraParams, inlierPoints1.Location, inlierPoints2.Location);
    translation = relPose.Translation;
    rotation = relPose.R;
end
