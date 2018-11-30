function [bbox] = boundingBox(nolines)
 
    
    nolines = logical(nolines);
    st = regionprops(nolines, 'BoundingBox');
    for k = 1 : length(st)
        thisBB = st(k).BoundingBox; 
        rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
        'EdgeColor','r','LineWidth',2 ) 
    end

    bbox = double(thisBB);

end