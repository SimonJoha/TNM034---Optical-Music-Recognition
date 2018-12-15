%%%%%%%%%%%%%%%%%%%%%%%%%%
function strout = tnm034(Im)
%
% Im: Input image of captured sheet music. Im should be in 
% double format, normalized to the interval [0,1]
%
% strout: The resulting character array of the detected notes. 
% The character array must follow the pre-defined format.
%
% Group members: 
% Jasmine Karlsson, Jonna Johansson, Jonathan Fransson, Simon Johasson

% clc
% close all
% clear

% Read image
% image = imread('Images_Training\im5s.jpg');
image = Im;
image = im2double(image);

% BW = makeImageBinary(image);
%[H, theta, rho, P, lines] = houghFunction(BW);

% Calculate the angle for which the image is originally rotated by
%rotatedImage = rotateImage(image, P, theta, lines);
rotatedImage = newRotate(image);
% figure
% imshow(rotatedImage);

BW = makeImageBinary(rotatedImage);
[horizontalProjection, begin, order] = horizontalProfile(BW);
[subIMG, sortedLinePos] = findStaffLines(BW, begin, order);
template = imread('gklav.png');

notes = '';

for i = 1:length(begin) - 1
    
    removeGInital = removeGClef(template, subIMG{i}, sortedLinePos);
    removeG{i} = removeGInital;
    
    [notePos, noteCharArrayFourths, noteCharArrayEights] = lineToNotes(sortedLinePos(:,i));
    [subIMG2, centroids, s] = findCentroids(removeG{i}, notePos);
    
    box = boundingBox2(removeG{i}, centroids);
    axisLength = (sum(s.MinorAxisLength)/(length(s.MinorAxisLength)));
    noteType = identifyTypeOfNote(box, centroids, removeG{i}, axisLength);
    % Answers are posted in notes
    notes = identifyNotes(centroids, notePos, noteCharArrayFourths, noteCharArrayEights, notes, noteType);
    strout = notes;
    
    
end

end