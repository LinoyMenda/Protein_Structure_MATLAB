function [array2D] = cordinatesDataBackbone3D(inputStruct)
%this function pick cordinates of backbone
%saving the first atom indexes from the input struct
indexs = inputStruct.firstAtomIndex.';
%creating a 3 dimentional array 
matrix3rows = [indexs ; indexs+1 ; indexs+2];
%converting the matrix into a column 
tempColumn = matrix3rows(:);
backbones = inputStruct.chainAtom(tempColumn);
array2D = numericalArr(backbones);
end

