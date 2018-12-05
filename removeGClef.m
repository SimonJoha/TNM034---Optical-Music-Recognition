function [removedG] = removeGClef(template, subIMG, sortedLinePos)
    % Removes G-clef and everything to the left of it from all stafflines
    % to not clutter the sub-images and not give false matching data when 
    % checking for centroids

    % Convert the g-clef template to an gray image 
    template = rgb2gray(template);
    
    % Resize the image - template with the the difference between the
    % stafflines, sortedLinePos multiplied by ratio of the distance from
    % the stafflines to the g-clef
    templateResize = imresize(template, [round((sortedLinePos(5)-sortedLinePos(1))*1.74) NaN]);
    
    % Use the resized template to locate where in the sub-image the g-clef
    % exist with the help of cross-correlation. Localize the peaks of the
    % cross-correlation which will represent the location of the g-clef.
    % Return the subIMG with the removed g-clef
    C = normxcorr2(templateResize, subIMG);
    [ypeak, xpeak] = find(C==min(C(:)));
    removedG = subIMG(:, xpeak:length(subIMG));

end

