function [subIMG, correctCentroids, s] = findCentroids(image, notePos)
    % Find all the centroid-objects in the image, in this case note heads,
    % and return its positions. 
    
    % Use a disk object to perform the opening morphological operation
    SE = strel('disk', 4);
    image = logical(image);
    subIMG = imopen(image, SE);

    % Plot the notes
    
    % Find all the centroids
    s = regionprops('table', subIMG, 'Centroid', 'MajorAxisLength', 'MinorAxisLength');
    centroids = cat(1, s.Centroid);
    correctCentroids = [];
    % Goes through all the centroids to check if they are between the
    % boundaries of the staff lines
    for i = 1:length(s.Centroid)
        if (s.Centroid(i,2) > notePos(1) && s.Centroid(i,2) < notePos(end))
            correctCentroids = [correctCentroids; centroids(i, :)];
        end
    end
%     figure
%     imshow(subIMG);
%     hold on
%     plot(correctCentroids(:,1), correctCentroids(:,2), 'b*');
%     hold off
end

