function [edf_labels] = read_label_text(fpath,fname)
%read_label_text This function is reading file name, start time, end time, 
% label and confidence level information from text file into cell array.
% Once the function called, it reads all the lines in the text file and
% returns cell array.

% Give the full path of the file (fpath) in order to avoid encountering 
% problems related to current working directory
% Specify which txt file (fname) you want to read 

% Reads and stores information into cell array
fileID = fopen([fpath fname]);
edf_labels = textscan(fileID,'%s %f %f %s %f');

end

