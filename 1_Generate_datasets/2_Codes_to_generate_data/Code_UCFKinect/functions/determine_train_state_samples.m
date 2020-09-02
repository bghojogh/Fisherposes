function [index_of_states, number_of_states, number_of_state_samples, state, name_of_states, name_of_actions, name_of_actions_withoutNumber] = determine_train_state_samples()
    %%%% guide: state(i,:) --> [which_person,which_performance,which_action,frame,state_index]
    
    %%
    state_cell = cell(1,1); % pre-define the cell
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 1 (Stand):
    state_index = 1;
    % all actions, first frame:
    counter = 0;
    for i = 1:16  % iteration on person
        for j = 1:16  % iteration on action
            for k = 1:5   % iteration on performance
                counter = counter + 1;
                state_cell{state_index}(counter,:) = [i,k,i,1,state_index];
            end
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 2 (Cross):
    state_index = 2;
    % cross, after first frames:
    counter = 0;
    for i = 31:185
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [1,1,1,i,state_index];
    end
    for i = 45:156
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [2,1,1,i,state_index];
    end
    for i = 25:196
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [3,1,1,i,state_index];
    end
    for i = 30:122
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [4,1,1,i,state_index];
    end
    for i = 30:147
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [5,1,1,i,state_index];
    end
    for i = 35:124
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [6,1,1,i,state_index];
    end
    for i = 25:127
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [7,1,1,i,state_index];
    end
    for i = 30:210
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [8,1,1,i,state_index];
    end
    for i = 25:175
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [9,1,1,i,state_index];
    end
    for i = 30:142
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [10,1,1,i,state_index];
    end
    for i = 1:182
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [11,1,1,i,state_index];
    end
    for i = 40:121
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [12,1,1,i,state_index];
    end
    for i = 40:125
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [13,1,1,i,state_index];
    end
    for i = 35:155
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [14,1,1,i,state_index];
    end
    for i = 40:133
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [15,1,1,i,state_index];
    end
    for i = 35:143
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [16,1,1,i,state_index];
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 3 (Right hand up) (left hand in plot):
    state_index = 3;
    % Climb ladder, a frame:
    state_cell{state_index}(1,:) = [1,1,2,28,state_index];
    state_cell{state_index}(2,:) = [1,1,2,78,state_index];
    state_cell{state_index}(3,:) = [1,1,2,132,state_index];
    state_cell{state_index}(4,:) = [2,1,2,29,state_index];
    state_cell{state_index}(5,:) = [2,1,2,78,state_index];
    state_cell{state_index}(6,:) = [3,1,2,43,state_index];
    state_cell{state_index}(7,:) = [3,1,2,76,state_index];
    state_cell{state_index}(8,:) = [3,1,2,120,state_index];
    state_cell{state_index}(9,:) = [3,1,2,159,state_index];
    state_cell{state_index}(10,:) = [4,1,2,39,state_index];
    state_cell{state_index}(11,:) = [4,1,2,110,state_index];
    state_cell{state_index}(12,:) = [5,1,2,64,state_index];
    state_cell{state_index}(13,:) = [5,1,2,110,state_index];
    state_cell{state_index}(14,:) = [6,1,2,29,state_index];
    state_cell{state_index}(15,:) = [6,1,2,93,state_index];
    state_cell{state_index}(16,:) = [7,1,2,23,state_index];
    state_cell{state_index}(17,:) = [7,1,2,55,state_index];
    state_cell{state_index}(18,:) = [7,1,2,86,state_index];
    state_cell{state_index}(19,:) = [8,1,2,19,state_index];
    state_cell{state_index}(20,:) = [8,1,2,57,state_index];
    state_cell{state_index}(21,:) = [8,1,2,99,state_index];
    state_cell{state_index}(22,:) = [8,1,2,145,state_index];
    state_cell{state_index}(23,:) = [8,1,2,192,state_index];
    state_cell{state_index}(24,:) = [9,1,2,49,state_index];
    state_cell{state_index}(25,:) = [9,1,2,99,state_index];
    state_cell{state_index}(26,:) = [9,1,2,155,state_index];
    state_cell{state_index}(27,:) = [10,1,2,28,state_index];
    state_cell{state_index}(28,:) = [10,1,2,72,state_index];
    state_cell{state_index}(29,:) = [11,1,2,1,state_index];
    state_cell{state_index}(30,:) = [11,1,2,39,state_index];
    state_cell{state_index}(31,:) = [11,1,2,85,state_index];
    state_cell{state_index}(32,:) = [11,1,2,132,state_index];
    state_cell{state_index}(33,:) = [12,1,2,29,state_index];
    state_cell{state_index}(34,:) = [12,1,2,80,state_index];
    state_cell{state_index}(35,:) = [12,1,2,127,state_index];
    state_cell{state_index}(36,:) = [13,1,2,49,state_index];
    state_cell{state_index}(37,:) = [13,1,2,50,state_index];
    state_cell{state_index}(38,:) = [13,1,2,114,state_index];
    state_cell{state_index}(39,:) = [14,1,2,57,state_index];
    state_cell{state_index}(40,:) = [14,1,2,112,state_index];
    state_cell{state_index}(41,:) = [15,1,2,36,state_index];
    state_cell{state_index}(42,:) = [15,1,2,94,state_index];
    state_cell{state_index}(43,:) = [16,1,2,27,state_index];
    state_cell{state_index}(44,:) = [16,1,2,65,state_index];
    state_cell{state_index}(45,:) = [16,1,2,114,state_index];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 4 (Left hand up) (right hand in plot):
    state_index = 4;
    % Climb ladder, a frame:
    state_cell{state_index}(1,:) = [1,1,2,49,state_index];
    state_cell{state_index}(2,:) = [1,1,2,105,state_index];
    state_cell{state_index}(3,:) = [2,1,2,56,state_index];
    state_cell{state_index}(4,:) = [2,1,2,109,state_index];
    state_cell{state_index}(5,:) = [3,1,2,28,state_index];
    state_cell{state_index}(6,:) = [3,1,2,57,state_index];
    state_cell{state_index}(7,:) = [3,1,2,98,state_index];
    state_cell{state_index}(8,:) = [3,1,2,138,state_index];
    state_cell{state_index}(9,:) = [3,1,2,182,state_index];
    state_cell{state_index}(10,:) = [4,1,2,76,state_index];
    state_cell{state_index}(11,:) = [4,1,2,150,state_index];
    state_cell{state_index}(12,:) = [5,1,2,46,state_index];
    state_cell{state_index}(13,:) = [5,1,2,86,state_index];
    state_cell{state_index}(14,:) = [5,1,2,128,state_index];
    state_cell{state_index}(15,:) = [6,1,2,64,state_index];
    state_cell{state_index}(16,:) = [7,1,2,40,state_index];
    state_cell{state_index}(17,:) = [7,1,2,73,state_index];
    state_cell{state_index}(18,:) = [7,1,2,105,state_index];
    state_cell{state_index}(19,:) = [8,1,2,38,state_index];
    state_cell{state_index}(20,:) = [8,1,2,76,state_index];
    state_cell{state_index}(21,:) = [8,1,2,126,state_index];
    state_cell{state_index}(22,:) = [8,1,2,169,state_index];
    state_cell{state_index}(23,:) = [9,1,2,29,state_index];
    state_cell{state_index}(24,:) = [9,1,2,78,state_index];
    state_cell{state_index}(25,:) = [9,1,2,129,state_index];
    state_cell{state_index}(26,:) = [10,1,2,49,state_index];
    state_cell{state_index}(27,:) = [10,1,2,96,state_index];
    state_cell{state_index}(28,:) = [11,1,2,20,state_index];
    state_cell{state_index}(29,:) = [11,1,2,64,state_index];
    state_cell{state_index}(30,:) = [11,1,2,108,state_index];
    state_cell{state_index}(31,:) = [11,1,2,158,state_index];
    state_cell{state_index}(32,:) = [12,1,2,58,state_index];
    state_cell{state_index}(33,:) = [12,1,2,104,state_index];
    state_cell{state_index}(34,:) = [12,1,2,144,state_index];
    state_cell{state_index}(35,:) = [13,1,2,82,state_index];
    state_cell{state_index}(36,:) = [13,1,2,153,state_index];
    state_cell{state_index}(37,:) = [14,1,2,29,state_index];
    state_cell{state_index}(38,:) = [14,1,2,86,state_index];
    state_cell{state_index}(39,:) = [14,1,2,146,state_index];
    state_cell{state_index}(40,:) = [15,1,2,66,state_index];
    state_cell{state_index}(41,:) = [15,1,2,123,state_index];
    state_cell{state_index}(42,:) = [16,1,2,47,state_index];
    state_cell{state_index}(43,:) = [16,1,2,89,state_index];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 5 (Hands up):
    state_index = 5;
    % Climb up, middle frame:
    state_cell{state_index}(1,:) = [1,1,3,28,state_index];
    state_cell{state_index}(2,:) = [1,2,3,30,state_index];
    state_cell{state_index}(3,:) = [1,3,3,28,state_index];
    state_cell{state_index}(4,:) = [1,4,3,32,state_index];
    state_cell{state_index}(5,:) = [1,5,3,31,state_index];
    state_cell{state_index}(6,:) = [2,1,3,45,state_index];
    state_cell{state_index}(7,:) = [2,2,3,30,state_index];
    state_cell{state_index}(8,:) = [2,3,3,40,state_index];
    state_cell{state_index}(9,:) = [2,4,3,30,state_index];
    state_cell{state_index}(10,:) = [2,5,3,35,state_index];
    state_cell{state_index}(11,:) = [3,1,3,30,state_index];
    state_cell{state_index}(12,:) = [3,2,3,37,state_index];
    state_cell{state_index}(13,:) = [3,3,3,30,state_index];
    state_cell{state_index}(14,:) = [3,4,3,36,state_index];
    state_cell{state_index}(15,:) = [3,5,3,30,state_index];
    state_cell{state_index}(16,:) = [4,1,3,45,state_index];
    state_cell{state_index}(17,:) = [4,2,3,38,state_index];
    state_cell{state_index}(18,:) = [4,3,3,35,state_index];
    state_cell{state_index}(19,:) = [4,4,3,33,state_index];
    state_cell{state_index}(20,:) = [4,5,3,34,state_index];
    state_cell{state_index}(21,:) = [5,1,3,44,state_index];
    state_cell{state_index}(22,:) = [5,2,3,39,state_index];
    state_cell{state_index}(23,:) = [5,3,3,40,state_index];
    state_cell{state_index}(24,:) = [5,4,3,40,state_index];
    state_cell{state_index}(25,:) = [5,5,3,33,state_index];
    state_cell{state_index}(26,:) = [6,1,3,50,state_index];
    state_cell{state_index}(27,:) = [6,2,3,55,state_index];
    state_cell{state_index}(28,:) = [6,3,3,50,state_index];
    state_cell{state_index}(29,:) = [6,4,3,55,state_index];
    state_cell{state_index}(30,:) = [6,5,3,40,state_index];
    state_cell{state_index}(31,:) = [7,1,3,30,state_index];
    state_cell{state_index}(32,:) = [7,2,3,25,state_index];
    state_cell{state_index}(33,:) = [7,3,3,66,state_index];
    state_cell{state_index}(34,:) = [7,4,3,29,state_index];
    state_cell{state_index}(35,:) = [7,5,3,22,state_index];
    state_cell{state_index}(36,:) = [8,1,3,25,state_index];
    state_cell{state_index}(37,:) = [8,2,3,20,state_index];
    state_cell{state_index}(38,:) = [8,3,3,23,state_index];
    state_cell{state_index}(39,:) = [8,4,3,22,state_index];
    state_cell{state_index}(40,:) = [8,5,3,23,state_index];
    state_cell{state_index}(41,:) = [9,1,3,30,state_index];
    state_cell{state_index}(42,:) = [9,2,3,27,state_index];
    state_cell{state_index}(43,:) = [9,3,3,27,state_index];
    state_cell{state_index}(44,:) = [9,4,3,24,state_index];
    state_cell{state_index}(45,:) = [9,5,3,31,state_index];
    state_cell{state_index}(46,:) = [10,1,3,33,state_index];
    state_cell{state_index}(47,:) = [10,2,3,30,state_index];
    state_cell{state_index}(48,:) = [10,3,3,30,state_index];
    state_cell{state_index}(49,:) = [10,4,3,29,state_index];
    state_cell{state_index}(50,:) = [10,5,3,22,state_index];
    state_cell{state_index}(51,:) = [11,1,3,24,state_index];
    state_cell{state_index}(52,:) = [11,2,3,26,state_index];
    state_cell{state_index}(53,:) = [11,3,3,29,state_index];
    state_cell{state_index}(54,:) = [11,4,3,44,state_index];
    state_cell{state_index}(55,:) = [11,5,3,33,state_index];
    state_cell{state_index}(56,:) = [12,1,3,43,state_index];
    state_cell{state_index}(57,:) = [12,2,3,29,state_index];
    state_cell{state_index}(58,:) = [12,3,3,23,state_index];
    state_cell{state_index}(59,:) = [12,4,3,33,state_index];
    state_cell{state_index}(60,:) = [12,5,3,33,state_index];
    state_cell{state_index}(61,:) = [13,1,3,45,state_index];
    state_cell{state_index}(62,:) = [13,2,3,40,state_index];
    state_cell{state_index}(63,:) = [13,3,3,40,state_index];
    state_cell{state_index}(64,:) = [13,4,3,35,state_index];
    state_cell{state_index}(65,:) = [13,5,3,36,state_index];
    state_cell{state_index}(66,:) = [14,1,3,33,state_index];
    state_cell{state_index}(67,:) = [14,2,3,40,state_index];
    state_cell{state_index}(68,:) = [14,3,3,28,state_index];
    state_cell{state_index}(69,:) = [14,4,3,35,state_index];
    state_cell{state_index}(70,:) = [14,5,3,27,state_index];
    state_cell{state_index}(71,:) = [15,1,3,40,state_index];
    state_cell{state_index}(72,:) = [15,2,3,35,state_index];
    state_cell{state_index}(73,:) = [15,3,3,33,state_index];
    state_cell{state_index}(74,:) = [15,4,3,32,state_index];
    state_cell{state_index}(75,:) = [15,5,3,32,state_index];
    state_cell{state_index}(76,:) = [16,1,3,36,state_index];
    state_cell{state_index}(77,:) = [16,2,3,29,state_index];
    state_cell{state_index}(78,:) = [16,3,3,43,state_index];
    state_cell{state_index}(79,:) = [16,4,3,32,state_index];
    state_cell{state_index}(80,:) = [16,5,3,30,state_index];
    % Leap, middle frame:
    action_index = 7;
    counter = 81;
    state_cell{state_index}(counter,:) = [1,1,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,2,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,4,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,5,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,1,action_index,31,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,2,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,3,action_index,32,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,4,action_index,31,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,5,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,1,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,2,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,3,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,4,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,5,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,1,action_index,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,2,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,2,action_index,50,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,3,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,4,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,5,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,1,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,2,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,3,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,4,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,5,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,1,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,2,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,3,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,4,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,5,action_index,30,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [7,1,action_index,38,state_index]; counter = counter + 1;   % not very good
    state_cell{state_index}(counter,:) = [7,2,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,3,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,4,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,5,action_index,32,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,1,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,2,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,3,action_index,23,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,4,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,5,action_index,24,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,1,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,2,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,3,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,4,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,5,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,1,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,2,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,3,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,4,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,5,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,1,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,2,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,3,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,4,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,5,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,1,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,2,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,3,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,4,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,5,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,1,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,2,action_index,35,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [13,3,action_index,39,state_index]; counter = counter + 1;   % not very good, but not remove
    state_cell{state_index}(counter,:) = [13,4,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,5,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,1,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,2,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,3,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,4,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,5,action_index,33,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [15,1,action_index,47,state_index]; counter = counter + 1;   % not very good, but not remove
    state_cell{state_index}(counter,:) = [15,2,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,3,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,4,action_index,32,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,5,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,1,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,2,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,3,action_index,39,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [16,4,action_index,37,state_index]; counter = counter + 1;   % remove (to not to have bad scale Fisher sub-space)
%     state_cell{state_index}(counter,:) = [16,5,action_index,36,state_index]; counter = counter + 1;   % remove (to not to have bad scale Fisher sub-space)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 6 (Duck):
    state_index = 6;
    % Duck, middle frame or last frame:
    counter = 1;
    state_cell{state_index}(counter,:) = [1,1,4,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,2,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,3,4,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,4,4,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,5,4,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,1,4,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,2,4,31,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,3,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,4,4,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,5,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,1,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,2,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,3,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,4,4,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,5,4,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,1,4,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,2,4,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,3,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,4,4,51,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,5,4,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,1,4,49,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,2,4,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,3,4,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,4,4,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,5,4,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,1,4,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,2,4,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,3,4,44,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [6,4,4,29,state_index]; counter = counter + 1;   % not very good
    state_cell{state_index}(counter,:) = [6,5,4,40,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [7,1,4,27,state_index]; counter = counter + 1;   % not very good
%     state_cell{state_index}(counter,:) = [7,2,4,32,state_index]; counter = counter + 1;   % not very good
%     state_cell{state_index}(counter,:) = [7,3,4,39,state_index]; counter = counter + 1;   % not very good
%     state_cell{state_index}(counter,:) = [7,4,4,33,state_index]; counter = counter + 1;   % not very good
%     state_cell{state_index}(counter,:) = [7,5,4,34,state_index]; counter = counter + 1;   % not very good
    state_cell{state_index}(counter,:) = [8,1,4,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,2,4,25,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,3,4,24,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,4,4,24,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,5,4,27,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,1,4,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,2,4,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,3,4,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,4,4,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,5,4,31,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,1,4,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,2,4,35,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [10,3,4,30,state_index]; counter = counter + 1;   % not very good
    state_cell{state_index}(counter,:) = [10,4,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,5,4,47,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,1,4,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,2,4,31,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,3,4,22,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,4,4,23,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,5,4,32,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [12,1,4,43,state_index]; counter = counter + 1;   % not very good
    state_cell{state_index}(counter,:) = [12,2,4,25,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [12,3,4,42,state_index]; counter = counter + 1;   % not very good
%     state_cell{state_index}(counter,:) = [12,4,4,42,state_index]; counter = counter + 1;   % not very good
%     state_cell{state_index}(counter,:) = [12,5,4,45,state_index]; counter = counter + 1;   % not very good
%     state_cell{state_index}(counter,:) = [13,1,4,38,state_index]; counter = counter + 1;   % not very good
    state_cell{state_index}(counter,:) = [13,2,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,3,4,57,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,4,4,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,5,4,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,1,4,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,2,4,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,3,4,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,4,4,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,5,4,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,1,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,2,4,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,3,4,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,4,4,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,5,4,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,1,4,59,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [16,2,4,34,state_index]; counter = counter + 1;   % not very good
    state_cell{state_index}(counter,:) = [16,3,4,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,4,4,36,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [16,5,4,39,state_index]; counter = counter + 1;   % not very good
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 7 (Kick):
    state_index = 7;
    % Kick, middle frame:
    action_index = 6;
    counter = 1;
    state_cell{state_index}(counter,:) = [1,1,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,2,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,3,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,4,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,5,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,1,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,2,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,3,action_index,30,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [2,4,action_index,30,state_index]; counter = counter + 1;  % opposite leg
    state_cell{state_index}(counter,:) = [2,5,action_index,33,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [3,1,action_index,29,state_index]; counter = counter + 1;  % opposite leg   % not very good
%     state_cell{state_index}(counter,:) = [3,2,action_index,26,state_index]; counter = counter + 1;  % opposite leg
%     state_cell{state_index}(counter,:) = [3,3,action_index,29,state_index]; counter = counter + 1;  % opposite leg
%     state_cell{state_index}(counter,:) = [3,4,action_index,29,state_index]; counter = counter + 1;  % opposite leg
%     state_cell{state_index}(counter,:) = [3,5,action_index,29,state_index]; counter = counter + 1;  % opposite leg
    state_cell{state_index}(counter,:) = [4,1,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,1,action_index,46,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,2,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,2,action_index,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,3,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,4,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,5,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,1,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,2,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,3,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,4,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,5,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,1,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,2,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,3,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,4,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,5,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,1,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,2,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,3,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,3,action_index,38,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [7,4,action_index,32,state_index]; counter = counter + 1;  % opposite leg
%     state_cell{state_index}(counter,:) = [7,5,action_index,24,state_index]; counter = counter + 1;  % opposite leg
    state_cell{state_index}(counter,:) = [8,1,action_index,27,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,2,action_index,31,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [8,3,action_index,33,state_index]; counter = counter + 1;   % not very good
    state_cell{state_index}(counter,:) = [8,4,action_index,22,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,5,action_index,26,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,1,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,1,action_index,46,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,2,action_index,34,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [9,3,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,4,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,5,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,1,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,2,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,3,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,4,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,5,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,1,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,2,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,3,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,4,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,5,action_index,14,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,1,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,2,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,3,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,4,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,5,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,1,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,2,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,3,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,4,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,5,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,1,action_index,44,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [14,2,action_index,38,state_index]; counter = counter + 1;  % opposite leg   % not very good
%     state_cell{state_index}(counter,:) = [14,3,action_index,25,state_index]; counter = counter + 1;   % not very good
%     state_cell{state_index}(counter,:) = [14,4,action_index,36,state_index]; counter = counter + 1;  % opposite leg   % not very good
    state_cell{state_index}(counter,:) = [14,5,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,1,action_index,38,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [15,2,action_index,34,state_index]; counter = counter + 1;  % opposite leg   % not very good
%     state_cell{state_index}(counter,:) = [15,3,action_index,34,state_index]; counter = counter + 1;  % opposite leg   % not very good
%     state_cell{state_index}(counter,:) = [15,4,action_index,27,state_index]; counter = counter + 1;  % opposite leg
%     state_cell{state_index}(counter,:) = [15,5,action_index,27,state_index]; counter = counter + 1;  % opposite leg
    state_cell{state_index}(counter,:) = [16,1,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,2,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,3,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,4,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,5,action_index,27,state_index]; counter = counter + 1;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 8 (Hand straight front):
    state_index = 8;
    % punch, middle frame:
    action_index = 8;
    counter = 1;
    state_cell{state_index}(counter,:) = [1,1,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,2,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,3,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,4,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,5,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,1,action_index,23,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,2,action_index,32,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,3,action_index,22,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,4,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,5,action_index,35,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [3,1,action_index,19,state_index]; counter = counter + 1;  % opposite hand
%     state_cell{state_index}(counter,:) = [3,2,action_index,20,state_index]; counter = counter + 1;  % opposite hand
%     state_cell{state_index}(counter,:) = [3,3,action_index,23,state_index]; counter = counter + 1;  % opposite hand
%     state_cell{state_index}(counter,:) = [3,4,action_index,30,state_index]; counter = counter + 1;  % opposite hand
%     state_cell{state_index}(counter,:) = [3,5,action_index,29,state_index]; counter = counter + 1;  % opposite hand
    state_cell{state_index}(counter,:) = [4,1,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,2,action_index,28,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [4,3,action_index,30,state_index]; counter = counter + 1;  % opposite hand
    state_cell{state_index}(counter,:) = [4,4,action_index,31,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,5,action_index,30,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [5,1,action_index,32,state_index]; counter = counter + 1;  % opposite hand
    state_cell{state_index}(counter,:) = [5,2,action_index,32,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [5,2,action_index,43,state_index]; counter = counter + 1;  % opposite hand
    state_cell{state_index}(counter,:) = [5,3,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,4,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,5,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,1,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,2,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,3,action_index,25,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,4,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,5,action_index,27,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [7,1,action_index,26,state_index]; counter = counter + 1;  % opposite hand   % not very good
%     state_cell{state_index}(counter,:) = [7,2,action_index,31,state_index]; counter = counter + 1;  % opposite hand
    state_cell{state_index}(counter,:) = [7,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,4,action_index,22,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,5,action_index,27,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,1,action_index,18,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [8,1,action_index,20,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [8,2,action_index,21,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,3,action_index,21,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,4,action_index,20,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,5,action_index,20,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,1,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,2,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,3,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,4,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,5,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,1,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,2,action_index,26,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,4,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,5,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,1,action_index,17,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,2,action_index,26,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,3,action_index,26,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,3,action_index,63,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [11,4,action_index,40,state_index]; counter = counter + 1;  % opposite hand
    state_cell{state_index}(counter,:) = [11,4,action_index,60,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,5,action_index,27,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,1,action_index,32,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,2,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,4,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,5,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,1,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,2,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,3,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,4,action_index,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,5,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,1,action_index,46,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [14,2,action_index,32,state_index]; counter = counter + 1;  % opposite hand
    state_cell{state_index}(counter,:) = [14,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,4,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,5,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,1,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,2,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,3,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,4,action_index,34,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,5,action_index,38,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [16,1,action_index,34,state_index]; counter = counter + 1;  % opposite hand
%     state_cell{state_index}(counter,:) = [16,2,action_index,30,state_index]; counter = counter + 1;  % opposite hand
%     state_cell{state_index}(counter,:) = [16,3,action_index,32,state_index]; counter = counter + 1;  % opposite hand
%     state_cell{state_index}(counter,:) = [16,4,action_index,29,state_index]; counter = counter + 1;  % opposite hand
%     state_cell{state_index}(counter,:) = [16,5,action_index,29,state_index]; counter = counter + 1;  % opposite hand

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 9 (jog):
    state_index = 9;
    % run, after first frames:
    action_index = 9;
    counter = 0;
    person_index = 1;
    for i = 30:90
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 30:79
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 35:92
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 35:67
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 30:77
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 2;
    for i = 35:105
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 35:92
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 75:100
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 37:84
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 35:107
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 3;
    for i = 30:170
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 30:127
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 30:135
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 30:148
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 30:141
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 4;
    for i = 35:110
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 35:105
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 35:93
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 35:85
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 35:82
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 5;
    for i = 50:120
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 45:101
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 40:104
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 35:103
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 40:84
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 6;
    for i = 35:107
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 40:106
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 30:105
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 35:106
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 30:74
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 7;
    for i = 35:106
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 30:127
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    person_index = 8;
    for i = 40:184
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 35:111
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 30:101
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 30:131
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 35:141
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 9;
    for i = 35:152
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 40:108
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 20:83
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 25:93
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 10;
    for i = 35:114
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 35:127         %%% good for plot
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 30:104
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 35:82
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 30:98
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 11;
    for i = 30:70
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 30:208
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 30:140
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 35:149
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 30:185
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 12;
    for i = 30:95
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 30:91
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 30:100         %%% good for plot
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 30:82
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 30:72
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 13;
    for i = 30:70
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    person_index = 14;
    for i = 30:119
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 35:124
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,2,action_index,i,state_index];
    end
    for i = 35:104
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 35:82
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 45:84
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end
    person_index = 16;
    for i = 55:121
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,1,action_index,i,state_index];
    end
    for i = 50:81
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,3,action_index,i,state_index];
    end
    for i = 35:97
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,4,action_index,i,state_index];
    end
    for i = 35:77
        counter = counter + 1;
        state_cell{state_index}(counter,:) = [person_index,5,action_index,i,state_index];
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 10 (Curved to left) (in plot: Curved to right):
    state_index = 10;
    % twist left, last frame:
    action_index = 14;
    counter = 1;
    state_cell{state_index}(counter,:) = [1,1,action_index,81,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,2,action_index,58,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,3,action_index,78,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,4,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,5,action_index,60,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,1,action_index,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,2,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,3,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,4,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,5,action_index,53,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,1,action_index,47,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,2,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,3,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,4,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,5,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,1,action_index,62,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,2,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,3,action_index,55,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,4,action_index,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,5,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,1,action_index,49,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,2,action_index,51,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,3,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,4,action_index,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,5,action_index,49,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,1,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,2,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,3,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,4,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,5,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,1,action_index,24,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,2,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,3,action_index,32,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,4,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,5,action_index,47,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,1,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,2,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,3,action_index,27,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,4,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,5,action_index,31,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,1,action_index,46,state_index]; counter = counter + 1;
    %state_cell{state_index}(counter,:) = [9,2,action_index,34,state_index]; counter = counter + 1;  % remove (not good)
    state_cell{state_index}(counter,:) = [9,3,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,4,action_index,47,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,5,action_index,49,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,1,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,2,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,3,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,4,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,5,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,1,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,2,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,3,action_index,49,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,4,action_index,31,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,5,action_index,88,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,1,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,2,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,3,action_index,37,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,4,action_index,46,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,5,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,1,action_index,47,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,2,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,3,action_index,46,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,4,action_index,54,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,5,action_index,49,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,1,action_index,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,2,action_index,50,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,3,action_index,57,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,4,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,5,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,1,action_index,53,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,2,action_index,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,3,action_index,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,4,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,5,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,1,action_index,53,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,2,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,3,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,4,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,5,action_index,40,state_index]; counter = counter + 1;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 11 (Curved to right) (in plot: Curved to left):
    state_index = 11;
    % twist right, last frame:
    action_index = 15;
    counter = 1;
    state_cell{state_index}(counter,:) = [1,1,action_index,59,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [1,2,action_index,59,state_index]; counter = counter + 1;   % perhaps not good
    state_cell{state_index}(counter,:) = [1,3,action_index,56,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,4,action_index,66,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [1,5,action_index,57,state_index]; counter = counter + 1;   % perhaps not good
    state_cell{state_index}(counter,:) = [2,1,action_index,43,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,2,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,3,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,4,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,5,action_index,47,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,1,action_index,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,2,action_index,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,4,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,5,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,1,action_index,53,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [4,2,action_index,45,state_index]; counter = counter + 1;   % perhaps not good
    state_cell{state_index}(counter,:) = [4,3,action_index,52,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,4,action_index,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,5,action_index,49,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,1,action_index,49,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,2,action_index,54,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,3,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,4,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,5,action_index,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,1,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,2,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,3,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,4,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,5,action_index,41,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [7,1,action_index,28,state_index]; counter = counter + 1;   % perhaps not good
    state_cell{state_index}(counter,:) = [7,2,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,3,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,4,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,5,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,1,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,2,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,3,action_index,56,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,4,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,5,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,1,action_index,54,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,2,action_index,60,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,3,action_index,44,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,4,action_index,58,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,5,action_index,52,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,1,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,2,action_index,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,3,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,4,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,5,action_index,38,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [11,1,action_index,38,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [11,2,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,3,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,4,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,5,action_index,30,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [12,1,action_index,38,state_index]; counter = counter + 1;   % perhaps not good
    state_cell{state_index}(counter,:) = [12,2,action_index,38,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [12,3,action_index,36,state_index]; counter = counter + 1;   % not good
    state_cell{state_index}(counter,:) = [12,4,action_index,40,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,5,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,1,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,2,action_index,45,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [13,3,action_index,52,state_index]; counter = counter + 1;   % not good
    state_cell{state_index}(counter,:) = [13,4,action_index,54,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,5,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,1,action_index,51,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,2,action_index,55,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,3,action_index,52,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,4,action_index,50,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,5,action_index,45,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,1,action_index,53,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,2,action_index,56,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,3,action_index,52,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,4,action_index,48,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,5,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,1,action_index,47,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,2,action_index,42,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,3,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,4,action_index,41,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,5,action_index,43,state_index]; counter = counter + 1;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% state 12 (Hands straight front):
    state_index = 12;
    % vault, middle frame:
    action_index = 16;
    counter = 1;
    state_cell{state_index}(counter,:) = [1,1,action_index,24,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,2,action_index,26,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,3,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,4,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [1,5,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,1,action_index,28,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [2,2,action_index,26,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,4,action_index,19,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [2,5,action_index,38,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,1,action_index,11,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,1,action_index,20,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,2,action_index,16,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,2,action_index,20,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,4,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [3,5,action_index,20,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,1,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,2,action_index,19,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,3,action_index,17,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,4,action_index,5,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [4,5,action_index,16,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,1,action_index,33,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [5,2,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,3,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,4,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [5,5,action_index,26,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,1,action_index,33,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,2,action_index,24,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,3,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,4,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [6,5,action_index,27,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,1,action_index,23,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,2,action_index,23,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,3,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [7,4,action_index,25,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [7,5,action_index,22,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,1,action_index,16,state_index]; counter = counter + 1;   % perhaps very good
    state_cell{state_index}(counter,:) = [8,2,action_index,17,state_index]; counter = counter + 1;   % perhaps very good
    state_cell{state_index}(counter,:) = [8,3,action_index,6,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [8,4,action_index,13,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [8,5,action_index,18,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,1,action_index,23,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,2,action_index,23,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,3,action_index,12,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,4,action_index,23,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [9,5,action_index,24,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,1,action_index,23,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,2,action_index,23,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [10,2,action_index,32,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,3,action_index,18,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,3,action_index,26,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,4,action_index,19,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,4,action_index,27,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [10,5,action_index,29,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,1,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,2,action_index,22,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,3,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,4,action_index,28,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [11,5,action_index,23,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [12,1,action_index,37,state_index]; counter = counter + 1;   % not good
    state_cell{state_index}(counter,:) = [12,2,action_index,22,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,3,action_index,17,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,4,action_index,22,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [12,5,action_index,20,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,1,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,2,action_index,20,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,3,action_index,23,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [13,3,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,4,action_index,36,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [13,5,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,1,action_index,25,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,2,action_index,27,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,3,action_index,25,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,4,action_index,20,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,5,action_index,17,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [14,5,action_index,24,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,1,action_index,22,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,2,action_index,18,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,3,action_index,17,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [15,4,action_index,22,state_index]; counter = counter + 1;   % very good
    state_cell{state_index}(counter,:) = [15,5,action_index,11,state_index]; counter = counter + 1;
%     state_cell{state_index}(counter,:) = [16,1,action_index,19,state_index]; counter = counter + 1;   % not very good
    state_cell{state_index}(counter,:) = [16,2,action_index,30,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,3,action_index,39,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,4,action_index,35,state_index]; counter = counter + 1;
    state_cell{state_index}(counter,:) = [16,5,action_index,39,state_index]; counter = counter + 1;
    
    %% name of states:
    name_of_states = {'Stand', 'Cross', 'Right hand up', 'Left hand up', 'Hands up', 'Duck', 'Kick', 'Hand straight front', 'Jog', 'Curved to left', 'Curved to right', 'Hands straight front'};
    
    %% name of actions:
    name_of_actions = {'(1) Balance';'(2) Climb ladder';'(3) Climb up';'(4) Duck';'(5) Hop'; '(6) Kick'; '(7) Leap'; '(8) Punch'; '(9) Run'; '(10) Step back'; '(11) Step front'; '(12) Step left'; '(13) Step right'; '(14) Twist left'; '(15) Twist right'; '(16) Vault'};
    name_of_actions_withoutNumber = {'Balance';'Climb ladder';'Climb up';'Duck';'Hop'; 'Kick'; 'Leap'; 'Punch'; 'Run'; 'Step back'; 'Step front'; 'Step left'; 'Step right'; 'Twist left'; 'Twist right'; 'Vault'};
    
    %%
    counter = 0;
    for i = 1:length(state_cell)
        for j = 1:size(state_cell{i},1)
            counter = counter + 1;
            state(counter,:) = state_cell{i}(j,:);
        end
    end
    
    %%
    index_of_states = unique(state(:,5));
    number_of_states = length(index_of_states);
    number_of_state_samples = size(state,1);
end