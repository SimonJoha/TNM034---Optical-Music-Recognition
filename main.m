clc
close all
clear

% Read image
%image = imread('Images_Training\jaaaasmin.png');
image = imread('Images_Training\im1s.jpg');
image = im2double(image);

% BW = makeImageBinary(image);
%[H, theta, rho, P, lines] = houghFunction(BW);

% Calculate the angle for which the image is originally rotated by
%rotatedImage = rotateImage(image, P, theta, lines);
rotatedImage = newRotate(image);
figure
imshow(rotatedImage);

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
    
    [notePos, noteChar] = lineToNotes(sortedLinePos(:,i));
    [subIMG2, centroids, s] = findCentroids(removeG{i}, notePos);
    
    notes = identifyNotes(centroids, notePos, noteChar, notes);
    figure
    imshow(removeG{i});
    box = boundingBox(removeG{i}, centroids);
    
%     identifyTypeOfNote(box, centroids, removeG{i});
    
    
end

%% 
% Fr�gor:

% Hur ska vi kunna identifiera fj�rde- och �ttondels noter?
% Hur blir vi av med alla sm�grejer som inte f�rsvinner i opening morphological operation? Typ balkarna som r�knas
% som centroids?????