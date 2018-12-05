function [bbox] = boundingBox(nolines)
    % Create bounding boxes around the ojects in the line-less image
    
    % Change the sub-image in to a logical image
    nolines = logical(nolines);
    % Plot the bounding boxes around the objects in the sub-image
    st = regionprops(nolines, 'BoundingBox');
    for k = 1:length(st)
        thisBB = st(k).BoundingBox; 
        rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
        'EdgeColor','r','LineWidth',2 ) 
    end
    
    % Return bounding boxes
    bbox = double(thisBB);

end