close all;
%function 2A
AllData = PDBreadFile();
%arrayfun applies the function matrixToRow3B to the elements of AllData.HetrogeneName, 
%one element at a time
AllData.HeterogenName = arrayfun(@matrixToRow3B,AllData.HeterogenName);
[SelectedchainID,materialID]=chainAndMaterial(AllData);
%creating a new struct
newStruct = struct('ligandID',[],'chainID',[],'ligandAtom',[],'chainAtom',[],'firstAtomIndex',[],'lastAtomIndex',[],'aminoAcidNames',[]);
newStruct.ligandID = materialID;
newStruct.chainID = SelectedchainID;
%using the function from 2 F
newStruct.chainAtom = dataChain(AllData.Model.Atom,newStruct.chainID);
temp = dataChain(AllData.Model.HeterogenAtom,newStruct.chainID);
%using the function from 2 B
newStruct.ligandAtom = FindAtomsWithType(temp,newStruct.ligandID);
%using the function from 3 A
[newStruct.firstAtomIndex, newStruct.lastAtomIndex] = identifyAtoms3A(newStruct.chainAtom);
%getting the names of the amino acids
structsFirstAtom =[newStruct.chainAtom(newStruct.firstAtomIndex)];
% remove pre and trailing blanks
newStruct.aminoAcidNames = [strtrim({structsFirstAtom.resName})];
%the cordinates of the backbone using function from 3 D
atomsOfBackbone = cordinatesDataBackbone3D(newStruct);
% plot number 1/ figure 1
f1 = figure
plot3(atomsOfBackbone(:,1),atomsOfBackbone(:,2),atomsOfBackbone(:,3),'-dc')
axis('equal')
%titles
xlabel('X')
ylabel('Y')
zlabel('Z')
%concatenating the file name and the chain id
header = ['file ', AllData.Header.idCode,' chain ', SelectedchainID];
title(header);
%4 A
cordLigand = numericalArr(newStruct.ligandAtom);
hold on;
scatter3(cordLigand(:,1),cordLigand(:,2),cordLigand(:,3),'ko')
%4 c
f2 = figure; %figure 2
%finding the minimum and maximum distances
% the chain data is  a distances matrix
chainData = distanceOfAtoms3F(newStruct);
minDist = min(min(chainData));
maxDist = max(max(chainData));
%creating a new struct
minmaxStruct = struct('minDistance',minDist, 'maxDistance', 30);
f3 = figure; %figure 3
while true
    %chainData = []
    edges = linspace(minmaxStruct.minDistance,maxDist,21);
    histogram(chainData,edges)
    %using function 2 H
    minmaxStruct = getFromUser2Nums(minmaxStruct);
    figure(f2)
    %visualization of the distances using function 4 B
    visualizationOfMutualDist4B(newStruct,chainData,minmaxStruct)
    answer = questdlg('do you want to change the min and max distance?');
    switch answer
        case 'No'
            break;
        case 'Yes'
            continue;
    end
    
end
title(AllData.Header.idCode);
%4 D
indexs = identAminoAcid3G(newStruct,chainData,minmaxStruct.minDistance);
% map colors to the atoms with numbers of colors as the number of the amino
% acid that were found
colorsmap = pink(length(indexs));
figure(f1)
%first and last indexs of the connection target
indexStartTarget = newStruct.firstAtomIndex(indexs);
indexLastTarget = newStruct.lastAtomIndex(indexs);
%A loop that passes through all the amino acids
for i=1:length(indexs)
    %creating an array of integers from the first index to the last index
    arrayOfInt = indexStartTarget(i):1:indexLastTarget(i);
    %selecting the atoms in the places of the array of int
    atoms = newStruct.chainAtom(arrayOfInt);
    %Pulling out the coordinates
    matrixCord = numericalArr(atoms);
    %selecting the color of the amino acid
    colorAA = colorsmap(i,:);
    scatter3(matrixCord(:,1),matrixCord(:,2),matrixCord(:,3),20,colorAA,'filled');
end
first=['backbone ',SelectedchainID];
second= materialID;
others = newStruct.firstAtomIndex(indexs);
aminoAcidInTheBond={newStruct.chainAtom(others).resName};
legend([first,second,aminoAcidInTheBond]); 


