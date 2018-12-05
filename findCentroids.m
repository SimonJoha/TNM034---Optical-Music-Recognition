function [subIMG, centroids] = findCentroids(image)
    % Find all the centroid-objects in the image, in this case note heads,
    % and return its positions. 
    
    % Use a disk object to perform the opening morphological operation
    SE = strel('disk', 4);
    image = logical(image);
    subIMG = imopen(image, SE);

%     % Plot the notes
    s = regionprops('table', subIMG, 'Centroid', 'MajorAxisLength', 'MinorAxisLength');
    centroids = cat(1, s.Centroid);
    figure
    imshow(subIMG);
    hold on
    plot(centroids(:,1), centroids(:,2), 'b*');
    hold off
end

