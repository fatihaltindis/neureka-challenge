clc; clear all;

% Indicating the file path
% [edf_dir] = get_EDF_files('C:\Users\[directory of the fiels]');
[edf_dir] = get_EDF_files('test');

% Reading label text file
% [edf_labels] = read_label_text('C:\Users\[directory of the fiels]','example_label.txt');
[edf_labels] = read_label_text('test\','example_label.txt');

% Convert first EDF file
%%%%% edfread is prerequisite %%%%%
[info,recordings] = edfread([edf_dir(1).folder '\' edf_dir(1).name]);

% Extracting EEG channels, corresponding channel names and sampling freq
[ch_names,ch_data,fs] = get_EEG_channels(info,recordings);

% Getting start and end time of background and seizure activities
s_ind = edf_labels{2}(strcmp(edf_dir(1).name(1:end-4),edf_labels{1}));
e_ind = edf_labels{3}(strcmp(edf_dir(1).name(1:end-4),edf_labels{1}));
disp('     start       end')
disp([s_ind e_ind])

% Getting labels of background and seizure activities of the recording
s_label = edf_labels{4}(strcmp(edf_dir(1).name(1:end-4),edf_labels{1}));
disp(s_label)

% Converting EEG records to Montages
[montage] = get_montage(ch_names,ch_data,'tcp_ar');


% Plotting montages
select_ch = 12; % Select montage

t=(1:length(montage(1,:)))/fs;
highlight = montage(select_ch,s_ind(2)*fs:e_ind(2)*fs);
plot(t,montage(select_ch,:));
hold on;
% Red part indicates seizure
plot(t(s_ind(2)*fs:e_ind(2)*fs),highlight,'Color','r')