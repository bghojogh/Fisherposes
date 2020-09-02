function [index_of_states, number_of_states, number_of_state_samples, state, name_of_states, name_of_actions, name_of_actions_withoutNumber] = determine_train_state_samples(number_of_actions,action_length)
    %%%% guide: state(i,:) --> [which_person,which_performance,which_action,frame,state_index]
    
    %%
    cd('./Excel_states')
    counter = 1;
    for i = 1:number_of_actions
        switch i
            case 1; data_excel = xlsread('sit.xlsx');
            case 2; data_excel = xlsread('Lay.xlsx');
            case 3; data_excel = xlsread('grasp.xlsx');
            case 4; data_excel = xlsread('walk.xlsx');
            case 5; data_excel = xlsread('front.xlsx');
            case 6; data_excel = xlsread('back.xlsx');
            case 7; data_excel = xlsread('side.xlsx');
            case 8; data_excel = xlsread('EndUpSit.xlsx');
        end
        for row_of_data = 1:size(data_excel,1)
            frame = 1;
            which_person = data_excel(row_of_data,2);
            which_performance = data_excel(row_of_data,3);
            which_action = data_excel(row_of_data,1);
            for column_of_data = 4:size(data_excel,2)   %--> notice: columns 1 to 3 are not frame data
                state_index = data_excel(row_of_data,column_of_data);
                if state_index ~= 9  %--> 9 in excel file means invalid (not good) frame
                    if frame <= action_length(which_person, which_performance, which_action)  %--> because: in the excel file, final frames are mostly repeated
                        state(counter,:) = [which_person,which_performance,which_action,frame,state_index];
                        counter = counter + 1;
                    end
                end
                frame = frame + 20;   %--> the frame data in excel files is with frame step 20
            end
        end
    end
    cd('..')
    
    %% name of states:
    name_of_states = {'Standing', 'Half sit', 'Lay back', 'Lay front', 'Lay side', 'Bend', 'Sit', 'Sit on ground'};
    
    %% name of actions:
    name_of_actions = {'(1) Sit';'(2) Grasp';'(3) Walk';'(4) Lay';'(5) Front'; '(6) Back'; '(7) Side'; '(8) End up sit'};
    name_of_actions_withoutNumber = {'Sit';'Grasp';'Walk';'Lay';'Front'; 'Back'; 'Side'; 'End up sit'};
    
    %%
    index_of_states = unique(state(:,5));
    number_of_states = length(index_of_states);
    number_of_state_samples = size(state,1);
end