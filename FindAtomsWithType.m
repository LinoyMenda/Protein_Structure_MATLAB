function [NewArrAtomStruct] = FindAtomsWithType(ArrAtomStruct,ArrType)
%this function finds atoms that belong to a specific material
%cell array of resnames
ResNames = {ArrAtomStruct.resName};
%deleting whitespaces
newResNames = strtrim(ResNames);
%creating a logical array- if equales =true 
ComparedArr = strcmp(newResNames,ArrType);
%saving in the output array of structs only the structs that return true.
NewArrAtomStruct = ArrAtomStruct(ComparedArr);

end

