function [bbox] = boundingBox(nolines, centroids)
    % Create bounding boxes around the ojects in the line-less image
    
    % Change the sub-image in to a logical image
    nolines = logical(nolines);
    % Plot the bounding boxes around the objects in the sub-image
    st = regionprops(nolines, 'BoundingBox');  
    % Goes through all the bounding boxes and keep those that hav a note in
    % them
    bbox = [];
    for k = 1:length(st)
        thisBB = st(k).BoundingBox;
        for i = 1:length(centroids)
            if (centroids(i, 1) > floor(thisBB(1)) && centroids(i, 1) < ceil((thisBB(1) + thisBB(3))) ... 
                && centroids(i, 2) > floor(thisBB(2)) && centroids(i, 2) < ceil(thisBB(2) + thisBB(4)));
                rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
                'EdgeColor', 'r', 'LineWidth', 1) 
                bbox = [bbox; thisBB(1),thisBB(2),thisBB(3),thisBB(4)];
            end
           
        end
    end
    
    % Return bounding boxes
%     bbox = double(thisBB);

end