function notes = identifyNotes(centroids, notePos, noteChar4th, noteChar8th, notes, noteType)
    % Identify notes based on their centroid position in relation to the
    % location of the stafflines. Returns the notes cell array which will
    % contain the notes on each sub-image
    
    % Goes through all the centroids and identify their position and what
    % note it is
    for k = 1:length(centroids)
        % Set tempNote to the first note position, which is the lowest
        % value of the notes. Second dimension contains the difference
        % between the centroid and the noteposition.
        tempNote = [notePos(1), centroids(k,2) - notePos(1), 1];
        
        % Loops through all note positions to find the one with the lowest
        % difference, which will represent what the note is most likely to
        % be
        for j = 1:length(notePos)
            diff = centroids(k,2) - notePos(j);
            if abs(diff) < tempNote(2)
                tempNote = [notePos(j), diff, j];
            end
        end
        
        % Used to filter out the incorrect note heads, i.e notes that are
        % outside the note boundaries. Check if the current note character
        % is equal to the incorrect note head and then ignore it
        incorrectNoteHead{1} = 'NO';
        if ~(strcmp(noteChar4th(tempNote(3)), incorrectNoteHead{1}))
            if(noteType(k) > 0)
                notes = [notes, noteChar8th(tempNote(3))];  
            else
                notes = [notes, noteChar4th(tempNote(3))];  
            end
                
        end
       
    end
end
