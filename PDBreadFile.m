function [PDBstruct] = PDBreadFile()
%the user select a file and uigetfile saves the path and the file name
[file,path] = uigetfile('*.ent');
%concatenate the path with the file name
FullNameOfFile = [path file];
%saving in the output struct the pdb data
PDBstruct = pdbread(FullNameOfFile);
end

