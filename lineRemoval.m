function outputIM = lineRemoval(binaryIM)
% make binary om det behövs
% imageB = rgb2gray(image);
% level = graythresh(imageB);
% Ib = imageB < level * 255;

% alternativ som inte är lika bra
% SE = strel('arbitrary', eye(3));
% openIM = imopen(binaryIM, SE);

outputIM = bwmorph(binaryIM, 'open');
end

