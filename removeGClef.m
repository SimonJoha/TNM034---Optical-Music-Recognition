function [removedG] = removeGClef(template, subIMG, sortedLinePos)
%REMOVEGCLEF Summary of this function goes here
%   Detailed explanation goes here

    template = rgb2gray(template);
    templateResize = imresize(template, [round((sortedLinePos(5)-sortedLinePos(1))*1.74) NaN]);
    C = normxcorr2(templateResize, subIMG);
    [ypeak, xpeak] = find(C==min(C(:)));
    removedG = subIMG(:, xpeak:length(subIMG));

end

