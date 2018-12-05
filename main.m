clc
close all
clear

% Read image
%image = imread('Images_Training\jaaaasmin.png');
image = imread('Images_Training\im3s.jpg');

BW = makeImageBinary(image);
%[H, theta, rho, P, lines] = houghFunction(BW);

% Calculate the angle for which the image is originally rotated by
%rotatedImage = rotateImage(image, P, theta, lines);
rotatedImage = newRotate(image);
figure
imshow(rotatedImage)



BW = makeImageBinary(rotatedImage);
figure
imshow(BW)


%%
[horizontalProjection, begin, order] = horizontalProfile(BW);
[subIMG, sortedLinePos] = findStaffLines(BW, begin, order);
template = imread('gklav.png');

notes = '';
for i = 1:length(begin) - 1
    
    removeGInital = removeGClef(template, subIMG{i}, sortedLinePos);
    removeG{i} = removeGInital;
    figure
    imshow(removeG{i});
    box = boundingBox(removeG{i}); 
    [subIMG2, centroids] = findCentroids(removeG{i});
    [notePos, noteChar] = lineToNotes(sortedLinePos(:,i));

    notes = identifyNotes(centroids, notePos, noteChar, notes);
    
end

