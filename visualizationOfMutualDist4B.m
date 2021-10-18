function [] = visualizationOfMutualDist4B(dataStruct,distMatrix,minmaxStruct)
%this function visualize the mutual distances
%saving the last row of the matrix in a new array
last_row = distMatrix(end,:);
%adding the new array of the last row to be the last row of the matrix
new_matrix = [distMatrix
    last_row];
%the same thing just with the last column
last_column = new_matrix(:,end);
new_matrix= [new_matrix last_column];
%creating a color map
pcolor(new_matrix)
%cancle the lines
shading flat;
%peaking the color map
colormap(hot);
%select the colors by min and max values
caxis([minmaxStruct.minDistance minmaxStruct.maxDistance]);
colorbar;
y = dataStruct.ligandAtom.resName;
ylabel(y);
x = ['chain ',dataStruct.chainID];
xlabel(x);
%creating a cell array with the atoms names
atomsNamesCellArray = {dataStruct.ligandAtom.AtomName};
ax = gca;
ax.XTick = dataStruct.firstAtomIndex;
ax.XTickLabel = dataStruct.aminoAcidNames;
ax.YTick = 1:length(atomsNamesCellArray);
ax.YTickLabel = atomsNamesCellArray;
ax.XTickLabelRotation=45;
end

