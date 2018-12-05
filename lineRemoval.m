function outputIM = lineRemoval(binaryIM)
    % Function remove horizontal lines in an image with the help of 
    % morphological operations. Return the image without the horizontal lines.

    % Create the object which will be used to do the open morphological
    % operation
    SE = strel('rectangle', [3, 1]);
    
    % Convert the image in to a logical variable
    binaryIM = logical(binaryIM);
    
    % Use the open morphological operation to remove stafflines. Convert
    % the new image to an double and return it.
    open = imopen(binaryIM, SE);
    outputIM = double(open);
end

