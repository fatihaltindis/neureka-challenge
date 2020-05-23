% This codes is reading EDF file name, start time, end time, label and 
% confidence level information into cell array. 

% Give the full path of the file in order to avoid encountering problems
% related to current working directory
path = 'indicate\file_path\label_txt';

% Specify which txt file you want to read 
fname = 'ref_train.txt';

% Reads and stores information in cell array
fileID = fopen([path fname]);
edf_labels = textscan(fileID,'%s %f %f %s %f');
