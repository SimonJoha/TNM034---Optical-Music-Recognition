function outputIM = lineRemoval(binaryIM)
% make binary om det beh�vs
% imageB = rgb2gray(image);
% level = graythresh(imageB);
% Ib = imageB < level * 255;

% alternativ som inte �r lika bra
%men kanske funkar
% SE = strel('arbitrary', eye(3));
% openIM = imopen(binaryIM, SE);

outputIM = bwmorph(binaryIM, 'open');
end

