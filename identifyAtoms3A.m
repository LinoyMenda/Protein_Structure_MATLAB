function [arrayIndexFirst,arrayIndexLast] = identifyAtoms3A(structsArray)
%this function recognize the atoms of the beginnings of the amino acids
%creating a column array of the resSeq of every struct in the input
columnArray = ([structsArray.resSeq])';
%saving only the indexes where there is a change in the number
newIndexs = find(diff(columnArray)~=0);
%concatenating the new indexes with the last atom
arrayIndexLast = [newIndexs ; length(structsArray)];
arrayIndexFirst = [1; newIndexs+1];
end

