function [rotImage] = newRotate(image)
%Finds best rotate angle 

    maxVal = 0;
    rotAng = -20;
        
    for i = -45:1:45
        revImg = imcomplement(image);
        rotatedIma = imrotate(revImg, i, 'bicubic');
        
        horizontalProjection = sum(rotatedIma(:,:,1), 2);
        peak = max(horizontalProjection);
%         imshow(rotatedImage);
        
        if (peak > maxVal)
            maxVal = peak;
            rotAng = i;
        end
        
    end
    
    maxVal = 0;
    tempAng = rotAng;
    
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

