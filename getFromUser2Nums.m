function [newDistanceStruct] = getFromUser2Nums(distanceStruct)
%this function gets input of 2 numbers that represent distance from the user
outputTitle = {'Enter minimum distance ', 'Enter maximun distance'};
definput = {num2str(distanceStruct.minDistance), num2str(distanceStruct.maxDistance)};

while true
    inputAnswers = inputdlg(outputTitle,'Distance',[1, 60], definput);
    newDistanceStruct.minDistance = str2num(inputAnswers{1});
    newDistanceStruct.maxDistance = str2num(inputAnswers{2});
    % all inputs are valid
    if ~isempty(newDistanceStruct.minDistance) & ~isempty(newDistanceStruct.maxDistance)
        break;
    end
    % both min and max distances are not valid
    if isempty(newDistanceStruct.minDistance) & isempty(newDistanceStruct.maxDistance)
        definput = {'please enter a valid number', 'please enter a valid number'};
    % only min Distance is not valid
    elseif isempty(newDistanceStruct.minDistance)
        definput = {'please enter a valid number', num2str(newDistanceStruct.maxDistance)};
    % only max Distance is not valid
    else
        definput = {num2str(newDistanceStruct.minDistance),'please enter a valid number'};
    end
end
end

