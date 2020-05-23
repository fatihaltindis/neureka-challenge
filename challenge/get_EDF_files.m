function [fdir] = get_EDF_files(fpath)
%get_EDF_files This function takes string input as path and returns all 
% the EDF file names that are under the given path. Also directory of all 
% the EDF files are given in a structure array.
%   If you would like to acces all the EDF files that are under the train
%   folder, you can just give path of train folder and this function
%   returns every single EDF file names and their directories.
temp = dir([fpath '/**/*.edf']);
fdir = rmfield(temp,{'date','bytes','isdir','datenum'});

end

