function [rotImage] = newRotate(image)
% Find best rotate angle with the help of horizontal projection 

    maxVal = 0;
    rotAng = -20;
    
    % Large interval to find best angle to then use with better accuracy
    for i = -45:1:45
        % Invert image to get intersting data (white in the image) as 
        % the highest value for the horizontal projection
        revImg = imcomplement(image);
        rotatedIma = imrotate(revImg, i, 'bicubic');
        
        % Will get the highest value when as much white color as possible
        % is in a straight line
        horizontalProjection = sum(rotatedIma(:,:), 2);
        peak = max(horizontalProjection);
        
        if (peak > maxVal)
            maxVal = peak;
            rotAng = i;
        end
        
    end
    
    maxVal = 0;
    tempAng = rotAng;
    
    % Use angle found in first loop to increase the rotational accuracy
    for i = tempAng-1:0.1:tempAng+1
        revImg = imcomplement(image);
        rotatedIma = imrotate(revImg, i, 'bicubic');
        
        horizontalProjection = sum(rotatedIma, 2);
        peak = max(max(horizontalProjection));
        
        if (peak > maxVal)
            maxVal = peak;
            rotAng = i;
        end
    end
    
    maxVal = 0;
    tempAng = rotAng;
    
    % Futher improve the rotation of the image with a lower step value
    for i = tempAng-0.1:0.01:tempAng+0.1
        revImg = imcomplement(image);
        rotatedIma = imrotate(revImg, i, 'bicubic');
        
        horizontalProjection = sum(rotatedIma, 2);
        peak = max(max(horizontalProjection));
        
        if (peak > maxVal)
            maxVal = peak;
            rotAng = i;
        end
    end
    
    revImg = imcomplement(image);
    rotatedIma = imrotate(revImg, rotAng, 'bicubic');
    rotImage = imcomplement(rotatedIma);
    

end

