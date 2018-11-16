clc
close all
clear

% Read image
image = imread('Images_Training\jaaaasmin.png');
% image = imread('Images_Training\im5s.jpg');

BW = makeImageBinary(image);
[H, theta, rho, P] = houghFunction(BW, image);

% Calculate the angle for which the image is originally rotated by
rotatedImage = rotateImage(image, P, theta);
figure
imshow(rotatedImage)



%Identifiera linjer
%Rotera bilder

%G�r bilden binary med thresholding

%G�r Morphological operations f�r att ta bort h�l/linjer



