%test for the functions (A,B)
AllData = PDBreadFile();
hetID = AllData.HeterogenName.hetID(1,:);
struct = FindAtomsWithType(AllData.Model.HeterogenAtom,hetID);
%test for the function (D)
[SelectedchainID,materialID] = chainAndMaterial(AllData)
%test for the function (F)
ProtainAtoms = dataChain(AllData.Model.Atom,SelectedchainID);
MaterialAtoms = dataChain(AllData.Model.HeterogenAtom,SelectedchainID);
%test for the function (H)
structureH.minDistance = [];
structureH.maxDistance = [];
structureH.minDistance = 5;
structureH.maxDistance = 30;
newstructureH = getFromUser2Nums(structureH);
%test for the function (J)
tenAtoms = AllData.Model.Atom(1:10);
numericalMatrix = numericalArr(tenAtoms)
scatter3(numericalMatrix(:,1), numericalMatrix(:,2),numericalMatrix(:,3));
xlabel('axis x')
ylabel('axis y')
zlabel('axis z')
%test for function 3A
identifyAtoms3A(AllData)