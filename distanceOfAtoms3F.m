function [arrayOfDistances] = distanceOfAtoms3F(dataStruct)
%this function calculates the distances of the atoms
%usind 2 J function
chainMatrix = numericalArr(dataStruct.chainAtom);
ligandMatrix = numericalArr(dataStruct.ligandAtom);
%using the function d10dist from the lecture
Ndim = size(chainMatrix,2);  % assume crd1 and crd2 are of the same dimension
arrayOfDistances = zeros(size(ligandMatrix,1), size(chainMatrix,1)); % initialize matrix or distances
for n=1:Ndim
    arrayOfDistances = arrayOfDistances + (chainMatrix(:,n)'-ligandMatrix(:,n)).^2; % implied expansion
end
arrayOfDistances = sqrt(arrayOfDistances);
end

