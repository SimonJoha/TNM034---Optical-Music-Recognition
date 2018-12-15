function [horizontalProjection, begin, order] = horizontalProfile(BW)
    % Use horizontal projection to find the areas of the image where
    % there is the least amount of data to then divide the image in to 
    % sub-images


    % Horizontal projection of binary image
    horizontalProjection = sum(BW, 2);
    
    % Max and min values of the projection 
    maxy = max(horizontalProjection);
    miny = min(horizontalProjection);

%     [rows, columns] = size(BW);
%     figure;
%     plot(horizontalProjection, 1:rows, 'b-');

    
    small = 1; % Find first small value
    order = 1; % Which subimage it is
    begin = 0;

    for i = 1:length(horizontalProjection)
        % Alternating between small and big value to specify where peaks
        % and lows are 
        if (small == 1)
            % Find index in the image that divides the relevant parts of
            % the image where there is a low. A low is a part that is less
            % than the minimum value + 1 divided by 2. If the minimum value
            % is 0 the + 1 with ensure that minimum values are still found
            if (horizontalProjection(i) < (miny + 1) * 2)
                small = 0;
                begin(order) = i;
            end
        else
            % Find a peak in the image and then start looking for a low
            % again. A peak is considered to be a peak if it is at least 
            % half of the maximum value in the horizontal projection
            if (horizontalProjection(i) > maxy/2) 
                small = 1;
                order = order + 1;
            end
        end
    end
end

