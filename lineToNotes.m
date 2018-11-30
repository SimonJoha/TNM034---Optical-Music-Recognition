function [notePosArray, noteCharArray] = lineToNotes(line)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    noteLetter = ['B2'; 'A2'; 'G2'; 'F2'; 'E2'; 'D2'; 'C2'; 'B1'; 'A1'; 'G1'; 'F1'; 'E1'; 'D1'; 'C1'];
    noteCharArray = cellstr(noteLetter);
    meanDistBetweenLines = ((line(5) - line(1)) / 4);
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
    notePosArray = [B2; A2; G2; F2; E2; D2; C2; B1; A1; G1; F1; E1; D1; C1];
end

