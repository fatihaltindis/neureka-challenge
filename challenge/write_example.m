clc; clear all;

% Indicating the file path
% [edf_dir] = get_EDF_files('C:\Users\[directory of the fiels]');
[edf_dir] = get_EDF_files('test');

% Reading label text file
% [edf_labels] = read_label_text('C:\Users\[directory of the fiels]','example_label.txt');
[edf_labels] = read_label_text('test\','example_label.txt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Classification Steps Into Here              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Let's say classifier trained and now classified this recording and
% predicted labels for this recording is the following;
predicted_labels = [1 0 1];

% Indicating the time of label changes and the end time of signal
% For this example there are two prediction change that are occured at t=33
% and t = 53. Total recording is 184 seconds so we added at the end of the
% label_time vector too.
label_time = [33 53 184];

% Confidence level shows probability of the prediction for each prediction
confidence_level = [0.83 0.91 0.58];

% Calling create_label_cell function to create cell array that consists of
% EDF file name predictions start and end times label (bckg or seiz) and
% confidence level.
[labeled_data] = create_label_cell(edf_dir(2).name(1:end-4),...
    predicted_labels,label_time,confidence_level);

% Now cell array of seizure event are created with start and end times of
% it. 
% Calling label_to_txt function to write text file
% This function will create text file named as 'prediction'
label_to_txt('prediction',labeled_data);