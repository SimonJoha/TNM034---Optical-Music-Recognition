function rotatedImage = rotateImage(image, peaks, theta)
    % Calculate the angle for which the image is originally rotated by
    possibleAngle = mode(peaks);
    possibleAngle = theta(possibleAngle(2));
    
    if (possibleAngle < 0)
        rotatedImage = imrotate(image, 90-abs(possibleAngle));
    else 
        rotatedImage = imrotate(image, abs(possibleAngle)-90);
    end 
end

