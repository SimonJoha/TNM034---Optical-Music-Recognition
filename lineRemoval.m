function outputIM = lineRemoval(binaryIM)
% make binary om det behövs
% imageB = rgb2gray(image);
% level = graythresh(imageB);
% Ib = imageB < level * 255;

% Tar bort stafflines
SE = strel('rectangle', [3, 1]);
open = imopen(binaryIM, SE);

% tar bort stafflines OCH notlinjer
% open = bwmorph(Ib, 'open');

outputIM = open;
end

