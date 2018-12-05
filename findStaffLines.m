function [subIMG, sortedLinePos] = findStaffLines(BW, begin, order)
    % FindStaffLines will return the sub-images, subIMG, of the binary image BW as
    % well as sortedLinePos. sortedLinePos contains the sorted line
    % positions of the stafflines of each sub-image. The matrix will
    % contain the indices where each staffline is

    % The length of the for loop depends on the length of the begin vector.
    % The begin variable will be how many 'collections' of stafflines
    % there are minus 1.
    for i = 1:length(begin)-1
        
        % Extract sub-image. use cell arrays because the size of the
        % sub-image will vary depending on the begin matrix's values
        subImg{i} = double(BW(begin(i):begin(i+1), :));
%         figure;
%         imshow(BW(begin(i):begin(i+1), :));        
        
        % Locate peaks of the horizontal projection and save their indices
        % (sublocs) and what their position is (subpks)
        horizonProf = sum(subImg{i}, 2);
        [subPks, subLocs] = findpeaks(horizonProf);
        % Find 5 maximum values, because there are always 5 stafflines
        [A, ind] = maxk(subPks, 5); 
        % Save the staffline at which the maximum value occurs at and then
        % sort the positions
        linPos(:,i) = subLocs(ind);
        sortedLinePos(:,i) = sort(linPos(:,i));
        % Remove the horizontal lines that exists in the image and save to
        % the cell array subIMG which will be returned. subIMG is a cell
        % array because the size of the sub-images may vary. 
        subIMG{i} = lineRemoval(subImg{i});
    end
end

