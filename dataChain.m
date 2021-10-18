function [arrStructForChainID] = dataChain(arrStruct, chainID)
%this function returns  data that belongs to a specific chain
%creating an array from chainID field of the struct
allChainID = [arrStruct.chainID];
%converting the array to a column array
allChainID = (allChainID)';
%a logical array where equal there will be true
logicalArr = (allChainID == chainID);
arrStructForChainID = arrStruct(logicalArr);
end

