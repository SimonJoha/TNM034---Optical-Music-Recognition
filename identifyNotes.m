function notes = identifyNotes(centroids, notePos, noteChar, notes)
    for k = 1:length(centroids)

        tempNote = [notePos(1), centroids(k,2) - notePos(1), 1];

        for j = 1:length(notePos)
            diff = centroids(k,2) - notePos(j);
            if abs(diff) < tempNote(2)
                tempNote = [notePos(j), diff, j];

            end
        end
        notes = [notes, noteChar(tempNote(3))];  
    end
end
