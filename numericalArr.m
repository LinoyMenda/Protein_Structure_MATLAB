function [matrix] = numericalArr(arrOfStruct)
%this function creates an array of Coordinates from fields of an array of
%structs
XColumn = [arrOfStruct.X];
% convert to column
XColumn = (XColumn)';
YColumn = [arrOfStruct.Y];
% convert to column
YColumn = (YColumn)';
ZColumn = [arrOfStruct.Z];
% convert to column
ZColumn = (ZColumn)';
matrix = [XColumn YColumn ZColumn];
end

