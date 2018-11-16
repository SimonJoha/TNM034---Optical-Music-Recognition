function blackWhite = makeImageBinary(image)

    % Convert from RGB to binary and get the threshold level
    imageB = rgb2gray(image);
    level = graythresh(imageB);
    
    % Use threshold level to get a black and white image 
    % Threshold the image, multiply by 255 because of values being between 0
    % and 255. 
    blackWhite = imageB < level * 255;

end

