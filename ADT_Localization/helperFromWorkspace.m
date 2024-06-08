function dataStruct = importFromWorkspace(t,data)
% Construct the signal structure. Flip the dimension of the data to match
% the input requirements.
signalStruct = struct('values',permute(data,[3 2 1]),...
    'dimensions',[1 3]);
dataStruct = struct('time',t(:),...
    'signals',signalStruct);
end

