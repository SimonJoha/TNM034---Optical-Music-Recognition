function [rotImage] = newRotate(image)
%Finds best rotate angle 

    maxVal = 0;
    rotAng = -20;
        
    for i = -20:1:20
        rotatedIma = imrotate(image, i, 'bicubic');
        
        [heightRot, lengthRot, depthRot] = size(rotatedIma);
        cropLength = ceil(abs(tand(i) * lengthRot));
        rotatedImage = rotatedIma((cropLength:(heightRot - cropLength)),:, :);
        
        horizontalProjection = sum(rotatedImage, 2);
        peak = max(max(horizontalProjection));
        
        if (peak > maxVal)
            maxVal = peak;
            rotAng = i;
        end
        
    end
    tempAng = rotAng;
    
    for i = tempAng-1:0.1:tempAng+1
        rotatedIma = imrotate(image, i, 'bicubic');
        
        [heightRot, lengthRot, depthRot] = size(rotatedIma);
        cropLength = ceil(abs(tand(i) * lengthRot));
        rotatedImage = rotatedIma((cropLength:(heightRot - cropLength)),:, :);
        
        horizontalProjection = sum(rotatedImage, 2);
        peak = max(max(horizontalProjection));
        
        if (peak > maxVal)
            maxVal = peak;
            rotAng = i;
        end
    end
        
    tempAng = rotAng;
    for i = angle-0.1:0.01:angle+0.1
        rotatedIma = imrotate(image, i, 'bicubic');
        
        [heightRot, lengthRot, depthRot] = size(rotatedIma);
        cropLength = ceil(abs(tand(i) * lengthRot));
        rotatedImage = rotatedIma((cropLength:(heightRot - cropLength)),:, :);
        
        horizontalProjection = sum(rotatedImage, 2);
        peak = max(max(horizontalProjection));
        
        if (peak > maxVal)
            maxVal = peak;
            rotAng = i;
        end
    end
    
    rotImage = imrotate(image, rotAng, 'bicubic');
    

end

