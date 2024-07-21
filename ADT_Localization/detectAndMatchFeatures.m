function [matchedPoints1, matchedPoints2] = detectAndMatchFeatures(grayFrame1, grayFrame2, featureType)
    switch featureType
        case 'KAZE'
            points1 = detectKAZEFeatures(grayFrame1);
            points2 = detectKAZEFeatures(grayFrame2);
        case 'SIFT'
            points1 = detectSIFTFeatures(grayFrame1);
            points2 = detectSIFTFeatures(grayFrame2);
        otherwise
            error('Unsupported feature type');
    end

    [features1, points1] = extractFeatures(grayFrame1, points1);
    [features2, points2] = extractFeatures(grayFrame2, points2);
    
    indexPairs = matchFeatures(features1, features2);
    matchedPoints1 = points1(indexPairs(:, 1), :);
    matchedPoints2 = points2(indexPairs(:, 2), :);
end
