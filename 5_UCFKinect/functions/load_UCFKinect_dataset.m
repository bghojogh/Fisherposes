function [ complete_skeleton,number_of_samples,action_length ] = load_UCFKinect_dataset( path,reload )
    if reload==0
        % load skeleton with all available data from a mat file
        disp('Loading Dataset...');
        
        cd('dataset')
        load('UCFKinect.mat','complete_skeleton','action_length','number_of_folders','number_of_tests','number_of_actions','number_of_joints','number_of_dimensions','scale_factor');
        cd('..')
        
    elseif reload==1
        % save skeleton with all available data in a mat file
        disp('Reloading Dataset...');
        
        % dataset parameters
        number_of_folders=16;
        number_of_tests=5;
        ActionName={'balance','climbladder','climbup','duck','hop','kick','leap','punch','run','stepback','stepfront','stepleft','stepright','twistleft','twistright','vault'};
        number_of_actions=size(ActionName,2);
        number_of_joints=15;
        number_of_dimensions=3;
        number_of_users=1;
        scale_factor = 0.1;
        
        complete_skeleton = zeros(number_of_folders,number_of_tests,number_of_actions,[],number_of_joints,number_of_dimensions);
        action_length = zeros(number_of_folders,number_of_tests,number_of_actions);
        for folder_idx = 1:number_of_folders
            for test_idx = 1:number_of_tests
                for actionName = ActionName
                    if strcmp(actionName,'balance')
                        action_idx=1;
                    elseif strcmp(actionName,'climbladder')
                        action_idx=2;
                    elseif strcmp(actionName,'climbup')
                        action_idx=3;
                    elseif strcmp(actionName,'duck')
                        action_idx=4;
                    elseif strcmp(actionName,'hop')
                        action_idx=5;
                    elseif strcmp(actionName,'kick')
                        action_idx=6;
                    elseif strcmp(actionName,'leap')
                        action_idx=7;
                    elseif strcmp(actionName,'punch')
                        action_idx=8;
                    elseif strcmp(actionName,'run')
                        action_idx=9;
                    elseif strcmp(actionName,'stepback')
                        action_idx=10;
                    elseif strcmp(actionName,'stepfront')
                        action_idx=11;
                    elseif strcmp(actionName,'stepleft')
                        action_idx=12;
                    elseif strcmp(actionName,'stepright')
                        action_idx=13;
                    elseif strcmp(actionName,'twistleft')
                        action_idx=14;
                    elseif strcmp(actionName,'twistright')
                        action_idx=15;
                    elseif strcmp(actionName,'vault')
                        action_idx=16;
                    end
                    
                    % read skeleton file
                    filename=strcat(path,num2str(folder_idx),'\',num2str(test_idx),'\',actionName,'.',num2str(test_idx),'.ske');
                    fid = fopen(filename{1});
                    line = fgetl(fid);
                    posMat = zeros([],number_of_users,number_of_joints,number_of_dimensions);
                    while ischar(line)
                        % parse frame title and index
                        [~,line] = strtok(line,'|');
                        [tmp,line] = strtok(line,'|');
                        frame = str2num(tmp)+1;
                        % parse numUsers title and value
                        [~,line] = strtok(line,'|');
                        [tmp,line] = strtok(line,'|');
                        numUsers = str2num(tmp);
                        % step through each user
                        for user = 1:numUsers
                            % parse userID title and value
                            [t,line] = strtok(line,'|');
                            [tmp,line] = strtok(line,'|');
                            userID = str2num(tmp);
                            % parse numJoints title and value
                            [t,line] = strtok(line,'|');
                            [tmp,line] = strtok(line,'|');
                            numJoints = str2num(tmp);
                            % step through each joint
                            for joint = 1:numJoints
                                % parse joint title and value
                                [t,line] = strtok(line,'|');
                                [tmp,line] = strtok(line,'|');
                                % this line preserves the joint IDs from OpenNI
                                %jointID = str2num(tmp);
                                % ---or---
                                % this line renumbers the joint IDs for ease of array manipulation
                                jointID = joint;
                                % parse orientation confidence title and value
                                [t,line] = strtok(line,'|');
                                [tmp,line] = strtok(line,'|');
                                oconf = str2num(tmp);
                                oriConf(frame,userID,jointID) = oconf;
                                % parse orientation title and value
                                [t,line] = strtok(line,'|');
                                ori = zeros(3);
                                for o = 1:9
                                    [tmp,line] = strtok(line,'|');
                                    ori(o) = str2num(tmp);
                                end
                                oriMat(frame,userID,jointID,:,:) = ori;
                                % parse position confidence title and value
                                [t,line] = strtok(line,'|');
                                [tmp,line] = strtok(line,'|');
                                pconf = str2num(tmp);
                                posConf(frame,userID,jointID) = pconf;
                                % parse position title and value
                                [t,line] = strtok(line,'|');
                                pos = zeros(1,3);
                                for p = 1:3
                                    [tmp,line] = strtok(line,'|');
                                    pos(p) = str2num(tmp);
                                end
                                posMat(frame,userID,jointID,:) = pos;
                            end
                        end
                        line = fgetl(fid);
                    end
                    fclose(fid);
                    
                    % number of frames
                    NumFrameSkelSpace=frame;
                    
                    % skeleton matrix
                    complete_skeleton(folder_idx,test_idx,action_idx,1:NumFrameSkelSpace,:,:)=permute(posMat(:,1,:,:),[1 3 4 2]);

                    % action length matrix
                    action_length(folder_idx,test_idx,action_idx)=NumFrameSkelSpace;
                    
                end
            end
        end
                        
        cd('dataset')
        save('UCFKinect.mat','complete_skeleton','action_length','number_of_folders','number_of_tests','number_of_actions','number_of_joints','number_of_dimensions','scale_factor');
        cd('..')
    end

    number_of_samples = zeros(size(complete_skeleton,1),size(complete_skeleton,3));
    for folder_idx = 1:size(complete_skeleton,1)
        for action_idx = 1:size(complete_skeleton,3)
            number_of_samples(folder_idx,action_idx) = size(complete_skeleton,2);
        end
    end
    
    complete_skeleton = complete_skeleton .*scale_factor;
    
end
