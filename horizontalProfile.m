function [horizontalProjection, begin, order] = horizontalProfile(BW)
%horizontalProjection Summary of this function goes here
%   Detailed explanation goes here
    horizontalProjection = sum(BW, 2);
    maxy = max(horizontalProjection)
    miny = min(horizontalProjection)

    [rows, columns] = size(BW);
    plot(horizontalProjection, 1:rows, 'b-');

    small = 1;
    order = 1;
    begin = zeros(size(horizontalProjection));

    for i = 1:size(horizontalProjection)
        if (small == 1)
            if (horizontalProjection(i) < miny*2)
                small = 0;
                begin(order) = i;
            end
        else
            if (horizontalProjection(i) > maxy/2)
                small = 1;
                order = order + 1;
            end
        end
    end
end

