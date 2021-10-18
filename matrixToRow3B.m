function [HeterogenNameStructNew] = matrixToRow3B(HetrogeneNameStruct)
% convert 2D Array to 1D array.
HeterogenNameStructNew = HetrogeneNameStruct;
HeterogenNameStructNew.ChemName = (HeterogenNameStructNew.ChemName)';
HeterogenNameStructNew.ChemName = HeterogenNameStructNew.ChemName(:)';
% remove pre and trailing blanks
HeterogenNameStructNew.ChemName = strtrim(HeterogenNameStructNew.ChemName);
end

