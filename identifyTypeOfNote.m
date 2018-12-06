function [noteType] = identifyTypeOfNote(bbox, centroids, image)

    for i = 1:length(bbox)-10
        boxImg = image(floor(bbox(i,2)):floor(bbox(i,2) + bbox(i,4)), floor(bbox(i,1)):floor(bbox(i,1) + bbox(i,3))); 
        vertiProjBox = sum(boxImg, 1);
        horiProjBox = sum(boxImg, 2);
%         figure
%         imshow(boxImg)
        [rows, columns] = size(vertiProjBox);
        figure;
        plot(1:columns, vertiProjBox, 'b-');
        [rows2, columns2] = size(horiProjBox);
        hold on
%         plot(horiProjBox, 1:rows2, 'r');
        findpeaks(horiProjBox);
        %[subPks, subLocs] = 
        % Find 5 maximum values, because there are always 5 stafflines
%         [A, ind] = maxk(subPks, 5); 
        hold off
    end
    noteType = 0;
end

