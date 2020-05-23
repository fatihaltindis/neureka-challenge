function [] = label_to_txt(fname,labeled_data)
%label_to_txt This function takes string to name text file and cell array 
% that contains information about predictions
%   MORE DETAIL
%   If there is a text file in current working directory that is named same
%   as fname variable, then this function adds new lines of information at
%   the end of the text file. So it is possible to call this function
%   couple of times to create label text file, since it does not delete
%   context of the text file. 
%   If there is no such a text file named as fname variable, it creates
%   one. 
%   This function does not return anything.

if ~ischar(fname)
    error('Filename should be string type.')
else
    fileID = fopen([fname '.txt'],'a+');
    for i = 1 : numel(labeled_data{1})
        fprintf(fileID,'%18s %.4f %.4f %.4f\n', labeled_data{1}{i}, ...
            labeled_data{2}(i),	labeled_data{3}(i), ...
            labeled_data{5}(i));
    end
    fclose(fileID);   
end

end

