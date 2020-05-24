function [ch_names,ch_data,sampling] = get_EEG_channels(info,chs)
%get_EEG_channels - This function takes edfread function outputs info and 
% channells. 'info' is a structure array of EDF file that contains sampling 
% rate, signal length, number of channels and electrode placement of the 
% recording. 'data channels' is the matrix of recordings that rows are
% channels and coloumns are measurements at each time instance.
% This function simply takes info and channels as inputs and returns cell
% array of strings that contains EEG channel names and corresponding
% channel data as a matrix. In addition it returns sampling rate of the
% recording as well.
%   

if size(chs,2) < size(chs,1)
    chs = chs';
end

% Extracting EEG channel names
eegs = info.label(contains(info.label,'EEG'));
chs = chs(contains(info.label,'EEG'),:);

% Clearing 'EEG' and 'REF' terms from the channel names
ch_names = cellfun(@(x) x(4:end-3),eegs,'UniformOutput',false);

% Excluding EKG channel
chs(contains(ch_names,'EKG'),:) = []; 
ch_names(contains(ch_names,'EKG')) = [];

ch_data = chs;
sampling = info.samples(1);     % Sampling rate of the recordings

end

