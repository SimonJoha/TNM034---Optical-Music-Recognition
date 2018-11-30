function [subIMG, centroids] = findCentroids(image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    SE = strel('disk', 4);
    image = logical(image);
    subIMG = imopen(image, SE);

    s = regionprops('table', subIMG, 'Centroid', 'MajorAxisLength', 'MinorAxisLength');
    centroids = cat(1, s.Centroid);
    figure
    imshow(subIMG);
    hold on
    plot(centroids(:,1), centroids(:,2), 'b*');
    hold off
end

