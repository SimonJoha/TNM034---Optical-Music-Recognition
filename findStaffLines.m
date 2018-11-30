function [subIMG, sortedLinePos] = findStaffLines(BW, begin, order)
    
    for i = 1:order-2
        subImg{i} = double(BW(begin(i):begin(i+1), :));
        horizonProf = sum(subImg{i}, 2);
        [subPks, subLocs] = findpeaks(horizonProf);
        [A, ind] = maxk(subPks, 5); %5 because there are always 5 staff lines
        linPos(:,i) = subLocs(ind);
        sortedLinePos(:,i) = sort(linPos(:,i))
        subIMG{i} = lineRemoval(subImg{i});
    end
end

