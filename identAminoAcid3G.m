function [aminoAcidInexes] = identAminoAcid3G(dataStruct, distMatrix, minDist)
%this function recognize the amino acids that are next to the ligand
%check for every column in the matrix if there is a number that is
%smaller then the minimum distance
logicalArray = any(distMatrix < minDist);
%select only the atoms that fits to the result of logical array
atoms = dataStruct.chainAtom(logicalArray);
%creating an array of the resSeq of every atom
resSeqArray1 = [atoms.resSeq];
%creating an array of strcuts of every first atom
structArray = dataStruct.chainAtom(dataStruct.firstAtomIndex);
%creating an array of the resSeq of every first atom in the input strcut
resSeqArray2 = [structArray.resSeq];
%checks if amino acid identifier is found in the anico acid which
%participate in the connection
membersLogicalArray = ismember(resSeqArray2, resSeqArray1);
%indexes of amino acid that were found close to the ligand
aminoAcidInexes = find(membersLogicalArray);
end

