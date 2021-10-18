function [SelectedchainID,materialID] = chainAndMaterial(PDBstruct)
%this function choose the chain and the ligand
%creating cell array with chemname inside of the struct
chemName = {PDBstruct.HeterogenName.ChemName};
%deleting whitspaces
newchemName = strtrim(chemName);
%if the size is 1 then the index is 1. else the user choose the index from
%the options.
if size(newchemName) == 1
    index1 = 1;
else 
    index1 = listdlg('ListString', newchemName,'SelectionMode','single', 'PromptString','Choose material:');
end
%creating a cell array of pdb hetID 
hetID = {PDBstruct.HeterogenName.hetID};
%select hetID in the index that the user choose
materialID = hetID{index1};
%deleting whitespaces
materialID = strtrim(materialID);
%using the function to find atoms with a specific id
chainWithMaterial = FindAtomsWithType(PDBstruct.Model.HeterogenAtom, materialID);
%creating a cell array with the chain id with the specific id in the output struct
ChainID = {chainWithMaterial.chainID};
%cell array of chain id without duplications
ChainIDWithoutDup = unique(ChainID);
if size(ChainIDWithoutDup) == 1
    SelectedchainID = ChainIDWithoutDup{1};
else 
    index2 = listdlg('ListString', ChainIDWithoutDup,'SelectionMode','single', 'PromptString','Choose chain:');
    SelectedchainID = ChainIDWithoutDup{index2};
end 
end

