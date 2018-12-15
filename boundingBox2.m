function [bbox] = boundingBox2(nolines, centroids)
 
    % Create bounding boxes around the ojects in the line-less image
    
    % Change the sub-image in to a logical image
    
    nolines = logical(nolines);
    st = regionprops(nolines, 'BoundingBox');
    bbox = [];
        for k = 1 : length(st)
            thisBB = st(k).BoundingBox;  
            for i = 1:length(centroids)
                if (centroids(i, 1) > floor(thisBB(1)) && centroids(i, 1) < ceil((thisBB(1) + thisBB(3))) ... 
                    && centroids(i, 2) > floor(thisBB(2)) && centroids(i, 2) < ceil(thisBB(2) + thisBB(4)))
                    
                    if (length(bbox) ~= 0 & (thisBB(1) < bbox(end, 1) + bbox(end, 3) ...
                        & thisBB(1) > bbox(end, 1) & bbox(end, 1:4) ~= thisBB))
                        topy = min(thisBB(2), bbox(end, 2));
                        leftx = min(thisBB(1), bbox(end, 1));
                        distx = max(thisBB(1) + thisBB(3), bbox(end, 1) + bbox(end, 3)) - leftx;
                        disty = max(thisBB(2) + thisBB(4), bbox(end, 2) + bbox(end, 4)) - topy;
                        bbox(end, :) = [leftx, topy, distx, disty, 0];
                        
                    elseif (length(bbox) ~= 0 & bbox(end, 1:4) == thisBB)
                        continue
                    else
                        bbox = [bbox; thisBB(1), thisBB(2), thisBB(3), thisBB(4), 0];
                   
                    end
                    
                end
%                 if(length(bbox) ~= 0)
%                     rectangle('Position', [bbox(end, 1), bbox(end, 2), bbox(end, 3), bbox(end, 4)],...
%                               'EdgeColor', 'r', 'LineWidth', 1);
%                           
%              
%                 end
            end
             
        end
        
       for i = 1:length(centroids)
           for k = 1:length(bbox)
               if (centroids(i, 1) > floor(bbox(k, 1)) && centroids(i, 1) < ceil((bbox(k, 1) + bbox(k, 3))) ... 
                    && centroids(i, 2) > floor(bbox(k, 2)) && centroids(i, 2) < ceil(bbox(k, 2) + bbox(k, 4)))
                    bbox(k, 5) = bbox(k, 5) + 1;
                    break
               end
           end
       end
           
          


    
end