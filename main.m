clc
close all
clear

% Read image
% image = imread('Images_Training\jaaaasmin.png');
image = imread('Images_Training\im5s.jpg');

BW = makeImageBinary(image);
[H, theta, rho, P, lines] = houghFunction(BW, image);

% Calculate the angle for which the image is originally rotated by
rotatedImage = rotateImage(image, P, theta);
figure
imshow(rotatedImage)

BW = makeImageBinary(rotatedImage);
figure
imshow(BW)
%%
[horizontalProjection, begin, order] = horizontalProfile(BW);

for i = 1:order-2
    subImg = BW(begin(i):begin(i+1), :);
    horizonProf = sum(subImg, 2);
    [subPks, subLocs] = findpeaks(horizonProf);
    [A, ind] = maxk(subPks, 5);
    linPos(:,i) = subLocs(ind);
    sortedLinePos = sort(linPos(:,i));
end

%NÄSTA GÅNG SIMON OCH JASMINE 
%SKA NI HITTA POSITIONERNA PÅ NOTERNA


%Identifiera linjer
%Rotera bilder

%Gör bilden binary med thresholding

%Gör Morphological operations för att ta bort hål/linjer



