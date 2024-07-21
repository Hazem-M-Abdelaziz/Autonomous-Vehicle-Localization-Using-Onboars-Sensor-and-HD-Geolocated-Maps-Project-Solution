function [matrix, inliers, inlierPoints1, inlierPoints2] = estimateMatrix(matchedPoints1, matchedPoints2, cameraParams, matrixType)
    switch matrixType
        case 'Essential'
            [matrix, inliers] = estimateEssentialMatrix(matchedPoints1.Location, matchedPoints2.Location, cameraParams);
        case 'Fundamental'
            [matrix, inliers] = estimateFundamentalMatrix(matchedPoints1.Location, matchedPoints2.Location);
        otherwise
            error('Unsupported matrix type');
    end
    
    inlierPoints1 = matchedPoints1(inliers);
    inlierPoints2 = matchedPoints2(inliers);
end
