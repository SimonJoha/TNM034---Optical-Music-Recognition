function [notePosArray, noteCharArrayFourths, noteCharArrayEights] = lineToNotes(line)
    % Create the note character array as well as the position of the notes.
    % Input argument is the sorted stafflines for each sub-image. 
    % notePosArray contains the position a note head has. noteCharArray is
    % the note character index
    
    % First and last argument is 'NO' which is used to get rid of potential
    % objects that lies outside of the boundaries and therefore should not
    % be considered actual notes. Then convert to a cell string object
    noteLetterFourths = ['NO'; 'C3';'B2'; 'A2'; 'G2'; 'F2'; 'E2'; 'D2'; 'C2'; 'B1'; 'A1'; 'G1'; 'F1'; 'E1'; 'D1'; 'C1'; 'NO'];
    noteCharArrayFourths = cellstr(noteLetterFourths);
    noteLetterEights = ['NO'; 'c3';'b2'; 'a2'; 'g2'; 'f2'; 'e2'; 'd2'; 'c2'; 'b1'; 'a1'; 'g1'; 'f1'; 'e1'; 'd1'; 'c1'; 'NO'];
    noteCharArrayEights = cellstr(noteLetterEights);
    % Calculate what position each note head should have to be considered a
    % specific note
    meanDistBetweenLines = ((line(5) - line(1)) / 4);
    C3 = line(1) - (meanDistBetweenLines * 2);
    B2 = line(1) - (meanDistBetweenLines * 1.5);
    A2 = (line(1) - meanDistBetweenLines);
    G2 = line(1) - (meanDistBetweenLines / 2);
    F2 = line(1);
    E2 = line(2) - (meanDistBetweenLines / 2);
    D2 = line(2);
    C2 = line(3) - (meanDistBetweenLines / 2);
    B1 = line(3);
    A1 = line(4) - (meanDistBetweenLines / 2);
    G1 = line(4);
    F1 = line(5) - (meanDistBetweenLines / 2);
    E1 = line(5);
    D1 = line(5) + (meanDistBetweenLines / 2);
    C1 = line(5) + meanDistBetweenLines;
    % If a lies outside these two distances it should not be considered an
    % note
    notANote = line(1) - (meanDistBetweenLines * 2.5);
    notANote2 = line(5) + (meanDistBetweenLines * 1.5);
    notePosArray = [notANote; C3; B2; A2; G2; F2; E2; D2; C2; B1; A1; G1; F1; E1; D1; C1; notANote2];
end

