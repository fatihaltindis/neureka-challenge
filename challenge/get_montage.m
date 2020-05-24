function [montage] = get_montage(ch_names,ch_data,type)
%get_montage This function takes cell array of strings that contains EEG
% channel names, matrix array of EEG recordings and montage type as inputs.
% It returns montage output matrix of these inputs.
%   MORE DETAIL
%   There are 3 types of recording folder in TUH_EEG Seizure dataset(TUSZ).
%   Montage type allows you to indicate which one you want to use to get
%   montages. Montage informations are taken from 
%   '..\_DOCS\04_channels.txt' file. For more information please look at 
%   that file. 

if ~ischar(type)
    error('type must be string.');
end

if size(ch_data,2) < size(ch_data,1)
    ch_data = ch_data';
end

montage = zeros(22,size(ch_data,2));

if strcmpi(type,'tcp_ar')
    % Montage configuration for TCP_AR configuration
    montage_line_1 = strsplit('FP1 F7 T3 T5 O1',' ');
    montage_line_2 = strsplit('FP2 F8 T4 T6 O2',' ');
    montage_line_3 = strsplit('A1 T3 C3 CZ C4 T4 A2',' ');
    montage_line_4 = strsplit('FP1 F3 C3 P3 O1',' ');
    montage_line_5 = strsplit('FP2 F4 C4 P4 O2',' ');
elseif strcmpi(type,'tcp_le')
    % Montage configuration for TCP_LE configuration
    montage_line_1 = strsplit('FP1 F7 T3 T5 O1',' ');
    montage_line_2 = strsplit('FP2 F8 T4 T6 O2',' ');
    montage_line_3 = strsplit('A1 T3 C3 CZ C4 T4 A2',' ');
    montage_line_4 = strsplit('FP1 F3 C3 P3 O1',' ');
    montage_line_5 = strsplit('FP2 F4 C4 P4 O2',' ');
elseif strcmpi(type,'tcp_ar_a')
    % Montage configuration for TCP_AR_A configuration
    montage_line_1 = strsplit('FP1 F7 T3 T5 O1',' ');
    montage_line_2 = strsplit('FP2 F8 T4 T6 O2',' ');
    montage_line_3 = strsplit('T3 C3 CZ C4 T4',' ');
    montage_line_4 = strsplit('FP1 F3 C3 P3 O1',' ');
    montage_line_5 = strsplit('FP2 F4 C4 P4 O2',' ');
else
    error('You can only choose tcp_ar, tcp_le or tcp_ar_a type.');
end

count = 1;
for j = 1:5
    batch = eval(['montage_line_' num2str(j)]);
    line = length(batch);
    for i = 1:line-1
        if any(strcmp(ch_names,batch{i})) && any(strcmp(ch_names,batch{i+1}))
            montage(count,:) = ch_data(strcmp(ch_names,batch{i}),:) - ch_data(strcmp(ch_names,batch{i+1}),:);
            count = count+1;
        else
            montage(count,:) = 0;
            count = count+1;
        end
    end
end

end

