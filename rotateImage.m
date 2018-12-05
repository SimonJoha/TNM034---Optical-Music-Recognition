function rotatedImage = rotateImage(image, peaks, theta, lines)
    % Calculate the angle for which the image is originally rotated by
    possibleAngle = mode(peaks);
    possibleAngle = theta(possibleAngle(2));
    
    % diff is used to decide what way the image is rotated
    % A negative value means a negative rotation angle and
    % a positive value vice versa
    diff = 0;
    for i = 1:length(lines)
        diff = diff + lines(i).point2(2) - lines(i).point1(2);
    end
    diff
    possibleAngle
    if (diff < 0)
        rotAngle = abs(possibleAngle) - 90;
    else 
        rotAngle = 90 - abs(possibleAngle);
    end 
    
%     rotatedIma = zeros(size(image))
    rotatedIma = imrotate(image, rotAngle, 'bicubic');
    [heightRot, lengthRot, depthRot] = size(rotatedIma);
    cropLength = ceil(abs(tand(rotAngle) * lengthRot));
    rotatedImage = rotatedIma((cropLength:(heightRot - cropLength)),:, :);
    
    
end

