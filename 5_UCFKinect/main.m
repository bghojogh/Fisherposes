%% Fisher Human Action Recognition:

%% MATLAB initializations:
clc
clear
%clear all      %%---> if using another dataset than the previous run, uncomment this line.
close all

%% Add path of functions:
addpath('./functions');
addpath('./functions_LDA');
addpath('./functions_HMM');

%% Settings:
save_skeleton_information_to_file = 1;
display_frame_mode = 0;  %%% 1: display mode on, 0: display mode off
global display_projected_LDA_mode; display_projected_LDA_mode = 0;  %%% 1: display mode on, 0: display mode off
global display_eigenvectors; display_eigenvectors = 0;  %%% 1: display mode on, 0: display mode off
global display_projected_LDA_test_mode; display_projected_LDA_test_mode = 0;  %%% 1: display mode on, 0: display mode off
global report_estimated_states_mode; report_estimated_states_mode = 0;  %%% 1: display mode on, 0: display mode off
global report_estimated_states_mode_ACTION; report_estimated_states_mode_ACTION = 6;
global report_trained_states_mode; report_trained_states_mode = 0;  %%% 1: display mode on, 0: display mode off
global report_trained_states_mode_ACTION; report_trained_states_mode_ACTION = 6;
global frame_step; frame_step = 5;
global frame_step_inMotion; frame_step_inMotion = 1;  % it should be always 1 (and it is better to be 1)
global distance_type; distance_type = 2;  %%% 1: Euclidean distance, 2: Mahalanobis distance
global do_subtract_from_total_mean; do_subtract_from_total_mean = 0;
global do_HMM_equal_sequence_numbers; do_HMM_equal_sequence_numbers = 0;  % 1: equal, 0: not equal
global target_distance_hip_to_spine; target_distance_hip_to_spine = 10;  % for scaling body
global INITIAL_distance_factor_for_accepting_frame; INITIAL_distance_factor_for_accepting_frame = 0;
global STEP_distance_factor_for_accepting_frame; STEP_distance_factor_for_accepting_frame = 5;
global length_of_window; length_of_window = 1;
global step_of_sliding; step_of_sliding = 1;
global use_manual_mahalanobis; use_manual_mahalanobis = 1;   %--> only means if distance_type = 2  //   % 1: manual mahalanobis, 0: ready-matlab function for mahalanobis
global const_cov; const_cov = 10^(8);   %--> used for manual mahalanobis
global scale_mode; scale_mode = 1;   % 1: scale body using hip and spine, 2: scale body using hip and head
global project_of_means_MODE; project_of_means_MODE = 1;    %--> type of calculation of projected means of classes // 1: project of means of classes, 2: mean of projected samples of each class
global display_motion_vectors_EVERY_PERFORMANCE; display_motion_vectors_EVERY_PERFORMANCE = 0;
global display_histogram_EVERY_PERFORMANCE; display_histogram_EVERY_PERFORMANCE = 0;
global display_histogram_TOTAL_ACTIONS; display_histogram_TOTAL_ACTIONS = 0;
global align_motions_to_one_plane; align_motions_to_one_plane = 0;  % used in funcion load_the_motive_joint and Calculate_Histogram
global normalize_histogram; normalize_histogram = 0;
global alpha_bins; global theta_bins;
if align_motions_to_one_plane == 0   %%%%% bins of histogram:
    alpha_bins = [45, 135, 225, 315];
    theta_bins = [0 25 50 75 100 125 150 175 180];
else
    theta_bins = [0 20 40 60 80 100 120 140 160 180];
end
global display_histogram_TEST; display_histogram_TEST = 0;
global report_test_estimates_in_histogram; report_test_estimates_in_histogram = 0;
%global omit_motion_part; omit_motion_part = 0;
global acceptance_factor_HMM; acceptance_factor_HMM = 25;  % the higher this factor, the harder (and more confident) to accept HMM result
global pass_how_many_HMM_estimates_to_motion_section; pass_how_many_HMM_estimates_to_motion_section = 2;  % this parameter can be an integer in limit [1,number_of_actions]
global report_estimates_in_HMM_and_motion; report_estimates_in_HMM_and_motion = 1;
save_confusionMtrix_highResolution = 0;    % 0: low resolution, 1: high resolution (make this parameter 1 for final result which is going to be on paper)

%% Load dataset:
global skeleton;
global action_length;
global number_of_samples;
dataset_idx = 3;  % UCFKinect dataset
[ skeleton,number_of_samples,action_length,joint_num,~,~,~,base_joint_center,base_joint_left,base_joint_right ] = load_dataset( dataset_idx );
%%%%% guide:
%%% skeleton --> which_person, which_performance, which_action, which_frame, which_joint, which_dimension(x,y,z) --> determines the coordinate of joint --> 6-D matrix
%%% number_of_samples --> which_person, which_action --> determines the number of performances of each person in each action --> 2-D matrix
%%% action_length --> which_person, which_performance, which_action --> determines the number of frames --> 3-D matrix
%%% base_joint_center --> hip joint
%%% base_joint_left --> left shoulder
%%% base_joint_right --> right shoulder
global number_of_actions; number_of_actions = size(skeleton,3);
global number_of_persons; number_of_persons = size(skeleton,1);
global hip_index; hip_index = base_joint_center;
global hip_index_after_joint_selection; hip_index_after_joint_selection = 3;  %% the hip index in joints_selected --> needed for removing redundant hip from skeleton
global left_shoulder; left_shoulder = base_joint_left;
global right_shoulder; right_shoulder = base_joint_right;
global spine_index; spine_index = 2;
global head_index; head_index = 1;
global motive_joint_index; motive_joint_index = hip_index;
global number_of_actions_in_top_layer; number_of_actions_in_top_layer = 11;  % the top layer for UCFKinect dataset

%% Select joints:
global joints_selected;
global number_of_selected_joints;
%joints_selected = [1 2 3 4 5 7 9 11 14 15 18 19];
%joints_selected = [1 2 3 4 5 7 8 9 11 12 14 15 18 19];
%joints_selected = 1:20;
joints_selected = 1:15;
number_of_selected_joints = length(joints_selected) - 1;  % -1 because of removing hip joint

%% display frame or frames:
global show_lines_between_joints; show_lines_between_joints = 1;
if display_frame_mode == 1
    disp('Display mode: displaying skeleton joints...');
    disp('Maximum Action Length:'); disp(max(max(max(action_length))));
    disp('Minimum Action Length:'); disp(min(min(min(action_length))));
    one_frame_or_whole_frames = 1;
    which_person = 16;
    which_performance = 5;
    which_action = 9;
    frame = 36;  %%% only used when "one_frame_or_whole_frames=0"
    pause_time = 0.001;   %%% pause time between frames. for example: 0.001
    display_frame_or_frames(one_frame_or_whole_frames,skeleton,which_person,which_performance,which_action,frame,dataset_idx,pause_time,target_distance_hip_to_spine);
    return  %%% terminate the program
end

%% Determine states manually for training LDA:
global index_of_states;
global number_of_states;
global number_of_state_samples;
global state;
global name_of_states;
global name_of_actions;
global name_of_actions_withoutNumber;
[index_of_states, number_of_states, number_of_state_samples, state, name_of_states, name_of_actions, name_of_actions_withoutNumber] = determine_train_state_samples();
%%%% guide: state(i,:) --> [which_person,which_performance,which_action,frame,state_index]

%% save the matrix of labeled states:
if save_skeleton_information_to_file == 1
    joints_matrix = [];
    labels_and_subjects_matrix = [];
    for i = 1:number_of_state_samples
        which_person = state(i,1); which_performance = state(i,2); which_action = state(i,3); frame = state(i,4);
        joints = load_joints_and_align_them(which_person,which_performance,which_action,frame);
        
        %%%% reshaping joints as a vector:
        joints_vector = reshape(joints', 1, []);  %%--> joints_vector: [x1, y1, z1, x2, y2, z2, ...] ---> 13 joints in UTKinect
        joints_matrix(end+1,:) = joints_vector;   %%--> rows: samples, columns: joint coordinates
        %%%% matrix of labels and subjects:
        labels_and_subjects_matrix(end+1,1) = state(i,5);   %%--> rows: samples, first column: labels (which state)
        labels_and_subjects_matrix(end,2) = state(i,1);   %%--> rows: samples, second column: subjects (which person)
    end
    %%%% save the mtrixes:
    cd('saved_files')
    %save joints_matrix.mat joints_matrix
    save labels_and_subjects_matrix.mat labels_and_subjects_matrix
    save state.mat state
    %save skeleton.mat skeleton
    cd('..')
end

%% Loop (Cross validation) on the dataset (with leave-one-out approach):
global confusion_matrix_action; confusion_matrix_action = zeros(number_of_actions,number_of_actions,number_of_persons);
global confusion_matrix_trainStates; confusion_matrix_trainStates = zeros(number_of_states,number_of_states,number_of_persons);
global confusion_matrix_trainStates_minDistances; confusion_matrix_trainStates_minDistances = zeros(number_of_states,number_of_states,number_of_persons);
global error_action; error_action = zeros(number_of_actions,number_of_persons);
for test_person = 1:number_of_persons
    if report_estimated_states_mode == 0
        disp('test person:'); disp(test_person);
    end
    
    %% Train LDA:
    u_norm_LDA = Train_LDA(test_person);
    if display_projected_LDA_mode == 1 || display_eigenvectors == 1
        return;  % terminate the program
    end

    %% Train HMM:
    for index_M = 1:number_of_actions_in_top_layer   % the length of M is number_of_actions in top layer
        M(index_M,1) = 5;   % M is the number of HMM states for each action
    end
    %M=[3;3;4;2;2;2;3;3;2;5];   % the length of M is number_of_actions
    
%     M=[3;6;5;5;2;5;5;5;3;3;2];
    [E,P,Pi] = Train_the_HMM(test_person, u_norm_LDA, M);
    
    %% Train Motion Histograms:
    mean_histogram_1D = Train_Motion_Histograms(test_person);
    
    %% Test:
    if test_person == 1
        estimated_action_HMM = [];
        estimated_action_MOTION = [];
        estimated_action_TOTAL = [];
        HMM_confidence = [];
        estimatedMatrix_action_HMM = [];
        confidenceMatrix_action_HMM = [];
    end
    [estimated_action_HMM, estimated_action_MOTION, estimated_action_TOTAL, HMM_confidence, estimatedMatrix_action_HMM, confidenceMatrix_action_HMM] = Test(test_person, u_norm_LDA, E, P, Pi, estimated_action_HMM, estimated_action_MOTION, estimated_action_TOTAL, HMM_confidence, mean_histogram_1D, estimatedMatrix_action_HMM, confidenceMatrix_action_HMM);
    
end

%% report the estimates in both HMM and motion parts:
if report_estimates_in_HMM_and_motion == 1
    disp('HMM results:');
    disp(estimated_action_HMM);
    disp('MOTION results:');
    disp(estimated_action_MOTION);
    disp('TOTAL results:');
    disp(estimated_action_TOTAL);
    disp('HMM_confidence:');
    disp(HMM_confidence);
    disp('=========================');
    disp('estimatedMatrix_action_HMM:');
    for j = 1:number_of_actions_in_top_layer
        str = sprintf('HMM Choice #%d:', j);
        disp(str);
        disp(estimatedMatrix_action_HMM{j});
    end
    disp('=========================');
    disp('confidenceMatrix_action_HMM:');
    for j = 1:number_of_actions_in_top_layer-1
        str = sprintf('HMM Choice #%d:', j);
        disp(str);
        disp(confidenceMatrix_action_HMM{j});
    end
end

%% plot and save confusion matrix:
%plotconfusion(targets,outputs);
confusion_matrix_trainStates_minDistances_mean = mean(confusion_matrix_trainStates_minDistances,3);
confusion_matrix_trainStates_mean = mean(confusion_matrix_trainStates,3);
for row = 1:size(confusion_matrix_trainStates_mean,1)
    confusion_matrix_trainStates_mean_percent(row,:) = (confusion_matrix_trainStates_mean(row,:) ./ sum(confusion_matrix_trainStates_mean(row,:))) * 100;
end
confusion_matrix_action_mean = mean(confusion_matrix_action,3);
for row = 1:size(confusion_matrix_action_mean,1)
    confusion_matrix_action_mean_percent(row,:) = (confusion_matrix_action_mean(row,:) ./ sum(confusion_matrix_action_mean(row,:))) * 100;
end
confusion_matrix_figure = figure;
clims = [0 100];
imagesc(confusion_matrix_action_mean_percent, clims);
colormap(gray);
colorbar();
cd('saved_files')
saveas(confusion_matrix_figure, './Confusion_matrix.jpg');
save confusion_matrix_action.mat confusion_matrix_action
save confusion_matrix_action_mean.mat confusion_matrix_action_mean
save confusion_matrix_action_mean_percent.mat confusion_matrix_action_mean_percent
save confusion_matrix_trainStates.mat confusion_matrix_trainStates
save confusion_matrix_trainStates_mean.mat confusion_matrix_trainStates_mean
save confusion_matrix_trainStates_mean_percent.mat confusion_matrix_trainStates_mean_percent
save confusion_matrix_trainStates_minDistances.mat confusion_matrix_trainStates_minDistances
save confusion_matrix_trainStates_minDistances_mean.mat confusion_matrix_trainStates_minDistances_mean
cd('..')

%% plot and save nice confusion matrix:
confusion_matrix_figure2 = figure;
set(gcf,'units','normalized','outerposition',[0 0 1 1]);
middleAccuracy = 50;
show_zeros = 0;
X_labels = name_of_actions_withoutNumber;
Y_labels = X_labels;
Color_type = 2;   % can be 1 or 2
plot_confusion_matrix(confusion_matrix_action_mean_percent, show_zeros, X_labels, Y_labels, number_of_actions, middleAccuracy, Color_type);
xticklabel_rotate([1:number_of_actions],45,X_labels,'interpreter','none');  %%%% rotate xTickLabels
cd('saved_files')
if save_confusionMtrix_highResolution == 0
    saveas(confusion_matrix_figure2, './Confusion_matrix2.jpg');
elseif save_confusionMtrix_highResolution == 1
    print(confusion_matrix_figure2,'-djpeg','-r500','./Confusion_matrix2.jpg');
end
cd('..')

%% calculate and save recognition rates:
error_action_mean = mean(error_action,2);
number_of_all_performances_in_each_action = zeros(number_of_actions,1);
error_action_percent = zeros(number_of_actions,1);
for which_action = 1:number_of_actions
    for which_person = 1:number_of_persons
        number_of_performances = number_of_samples(which_person,which_action);
        number_of_all_performances_in_each_action(which_action) = number_of_all_performances_in_each_action(which_action) + number_of_performances;
    end
    error_action_percent(which_action) = (sum(error_action(which_action,:)) / number_of_all_performances_in_each_action(which_action)) * 100;
end
correct_action_percent = 100 - error_action_percent;
correct_action_percent_total = 100 * sum(correct_action_percent) / (100 * length(correct_action_percent));
disp('Recognition rates:');
disp(correct_action_percent);
disp('Total Recognition rate:');
disp(correct_action_percent_total);
cd('saved_files')
save error_action.mat error_action
save error_action_mean.mat error_action_mean
save number_of_all_performances_in_each_action.mat number_of_all_performances_in_each_action
save error_action_percent.mat error_action_percent
save correct_action_percent.mat correct_action_percent
save correct_action_percent_total.mat correct_action_percent_total
cd('..')

%% display rates in a table:
for i = 1:length(name_of_actions)+3
    if i <= length(name_of_actions)
        Actions{i} = name_of_actions{i};
    elseif i == length(name_of_actions)+1
        Actions{i} = 'frame step';
    elseif i == length(name_of_actions)+2
        Actions{i} = 'Number of joints (not hip)';
    else
        Actions{i} = 'Total';
    end
end
Rates = [correct_action_percent; frame_step; number_of_selected_joints; correct_action_percent_total];
MakeTableGUI(Actions, Rates);









