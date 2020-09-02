function [All_estimated_poses_CrossSubject] = Test(test_person, u_norm_LDA, All_estimated_poses_CrossSubject)

global index_of_states;
global number_of_states;
global number_of_state_samples;
global state;
global name_of_states;
global name_of_actions;
global joints_selected;
global number_of_selected_joints;
global do_subtract_from_total_mean;
global display_projected_LDA_mode;
global LDA_projected_joints_of_specific_states;
global project_of_means_MODE;
global distance_type;
global const_cov;
global use_manual_mahalanobis;
global LDA_projected_state_means;
global projected_means_of_classes;
global LDA_projected_states;
global covariance_matrix;
global distance_average_of_averages;
global action_length;
global frame_step;
global number_of_actions;
global number_of_persons;
global number_of_samples;
global report_trained_states_mode;
global step_of_sliding;
global length_of_window;
global INITIAL_distance_factor_for_accepting_frame;
global STEP_distance_factor_for_accepting_frame;
global do_HMM_equal_sequence_numbers;
global report_estimated_states_mode;
global report_estimated_states_mode_ACTION; 
global display_projected_LDA_test_mode;
global confusion_matrix_action;
global error_action;
global acceptance_factor_HMM;
global omit_motion_part;
global pass_how_many_HMM_estimates_to_motion_section;
global report_estimates_in_HMM_and_motion;

frame_step = 1;

%%%% loop:
which_person = test_person;
for which_action = 1:number_of_actions
    number_of_performances = number_of_samples(which_person,which_action);
    for which_performance = 1:number_of_performances
        %%%% finding distances:
        frames = 1:frame_step:action_length(which_person,which_performance,which_action);
        for frame = frames
            %%%% load joints:
            joints = load_joints_and_align_them(which_person,which_performance,which_action,frame);
            %%%% projecting frame samples onto the Fisher LDA projection directions:
            if do_subtract_from_total_mean == 1
                LDA_projected_joints = u_norm_LDA * reshape(joints - train_joints_total_mean,[],1);
            else
                LDA_projected_joints = u_norm_LDA * reshape(joints,[],1);
            end
            %%%% distance between projected joints and classes:
            [estimated_class(frame), distance_estimated_class(frame), ~] = calculate_distance(LDA_projected_joints, LDA_projected_state_means, projected_means_of_classes, LDA_projected_states, covariance_matrix, const_cov, distance_type, use_manual_mahalanobis, number_of_states);
            All_estimated_poses_CrossSubject(test_person, which_performance, which_action, frame, :) = estimated_class(frame);
        end
    end
end

end