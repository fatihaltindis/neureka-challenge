function [labeled_data] = create_label_cell(fname,pred_lab,time,conf)
%create_label_cell This function takes string for EDF filename, predicted 
% label vector of the corresponding EDF file (in case of that the record 
% includes both seziure and background in it). As a third input, function
% takes time vector which has the same length with predicted label vector.
% Fourth input is a vector that corresponds to confidence level of the 
% predictions. 
% Then function creates and returns cell array that has filename, start 
% time, end time, label and confidence level informations formatted. 


    label_create_counter = 1;

    %%% Labeling Format
    if pred_lab(1) == 1
        cur_lab = 'bckg';
        next_lab = 'seiz';
    else
        cur_lab = 'seiz';
        next_lab = 'bckg';
    end
    if size(pred_lab,1) ~= 1
        pred_lab = pred_lab';
    end
    [~,change_inds] = find(diff(pred_lab)~=0);
    if isempty(change_inds) 
        % If all the all the record predicted to belong to same class

        labeled_data{1,1}{label_create_counter} = fname;
        labeled_data{1,2}(label_create_counter) = 0;
        labeled_data{1,3}(label_create_counter) = time(end);
        labeled_data{1,4}{label_create_counter} = cur_lab;
        labeled_data{1,5}(label_create_counter) = conf(1);

    elseif numel(change_inds) == 1 
        % If first part of the recording predicted to belong to a one class 
        % and remaining of the recording belongs to other class
        % First part of the prediction
        labeled_data{1,1}{label_create_counter} = fname;
        labeled_data{1,2}(label_create_counter) = 0;
        labeled_data{1,3}(label_create_counter) = time(change_inds(1));
        labeled_data{1,4}{label_create_counter} = cur_lab;
        labeled_data{1,5}(label_create_counter) = conf(1);

        % Update labeling and label counter
        [cur_lab, ~] = deal(next_lab,cur_lab);
        label_create_counter = label_create_counter+1;

        % Second part of the prediction
        labeled_data{1,1}{label_create_counter} = fname;
        labeled_data{1,2}(label_create_counter) = time(change_inds(1));
        labeled_data{1,3}(label_create_counter) = time(end);
        labeled_data{1,4}{label_create_counter} = cur_lab;
        labeled_data{1,5}(label_create_counter) = conf(2);

    else
        % If there are more than one prediction changes in a given record
        % First part of the prediction
        labeled_data{1,1}{label_create_counter} = fname;
        labeled_data{1,2}(label_create_counter) = 0;
        labeled_data{1,3}(label_create_counter) = time(change_inds(1));
        labeled_data{1,4}{label_create_counter} = cur_lab;
        labeled_data{1,5}(label_create_counter) = 1;

        % Update labeling and label counter
        [cur_lab, next_lab] = deal(next_lab,cur_lab);
        label_create_counter = label_create_counter+1;

        % Start iterating for remaining of the predictions
        for pre = 1:numel(change_inds)-1 
            labeled_data{1,1}{label_create_counter} = fname;
            labeled_data{1,2}(label_create_counter) = time(change_inds(pre));
            labeled_data{1,3}(label_create_counter) = time(change_inds(pre+1));
            labeled_data{1,4}{label_create_counter} = cur_lab;
            labeled_data{1,5}(label_create_counter) = 1;

            % Update labeling and label counter
            [cur_lab, next_lab] = deal(next_lab,cur_lab);
            label_create_counter = label_create_counter+1;

        end

        % Last prediction change
        labeled_data{1,1}{label_create_counter} = fname;
        labeled_data{1,2}(label_create_counter) = time(change_inds(end));
        labeled_data{1,3}(label_create_counter) = time(end);
        labeled_data{1,4}{label_create_counter} = cur_lab;
        labeled_data{1,5}(label_create_counter) = 1;

    end
    
end