function [ complete_skeleton,number_of_samples,action_length ] = load_TST_dataset( path,reload )
    if reload==0
        % load skeleton with all available data from a mat file
        disp('Loading Dataset...');
        
        cd('dataset')
        load('TST.mat','complete_skeleton','action_length','number_of_folders','number_of_tests','number_of_actions','number_of_joints','number_of_dimensions','scale_factor');
        cd('..')
        
    elseif reload==1
        % save skeleton with all available data in a mat file
        disp('Reloading Dataset...');
        
        % dataset parameters
        number_of_folders=11;
        number_of_tests = 3;
        ADLFolderName = {'sit','grasp','walk','lay'};
        FallFolderName = {'front','back','side','EndUpSit'};
        number_of_actions = size(ADLFolderName,2) + size(FallFolderName,2);
        number_of_joints = 25;
        number_of_dimensions = 3;
        scale_factor = 0.1;
        
        complete_skeleton = zeros(number_of_folders,number_of_tests,number_of_actions,[],number_of_joints,number_of_dimensions);
        action_length = zeros(number_of_folders,number_of_tests,number_of_actions);
        for folder_idx = 1:number_of_folders
            for groupName = {'ADL' 'Fall'}
                if strcmp(groupName,'ADL')
                    subfolder = ADLFolderName;
                else
                    subfolder = FallFolderName;
                end
                for name_Subfolder = subfolder
                    if strcmp(name_Subfolder,'sit')
                        action_name=1;
                    elseif strcmp(name_Subfolder,'grasp')
                        action_name=2;
                    elseif strcmp(name_Subfolder,'walk')
                        action_name=3;
                    elseif strcmp(name_Subfolder,'lay')
                        action_name=4;
                    elseif strcmp(name_Subfolder,'front')
                        action_name=5;
                    elseif strcmp(name_Subfolder,'back')
                       action_name=6;
                    elseif strcmp(name_Subfolder,'side')
                       action_name=7;
                    elseif strcmp(name_Subfolder,'EndUpSit')
                       action_name=8;
                    end

                    for test_idx = 1:number_of_tests
                        Folder = strcat(path,num2str(folder_idx),'\',cell2mat(groupName),'\',cell2mat(name_Subfolder),'\',num2str(test_idx)); %Folder where are stored the data

                        % Load skeleton
                        fileNameSk1DS = strcat(Folder,'\Body','\Fileskeleton.csv'); %joint in the depth frame
                        fileNameSk1SS = strcat(Folder,'\Body','\FileskeletonSkSpace.csv'); %joint in 3D space
                        Sk1SkDepth = csvread(fileNameSk1DS);
                        Sk1SkSpace = csvread(fileNameSk1SS);

                        % Find player number:
                        for idx_player = 1:6
                            if Sk1SkDepth(25*(idx_player-1)+1,1) ~= 0
                                break;
                            end
                        end

                        % Find row index of the specific player in Sk1SkDepth:
                        row_idx = find(Sk1SkDepth(:,5) == idx_player-1);
                        Sk1SkDepth = Sk1SkDepth(row_idx,:);
                        NumFrameSkelDepth = fix(length(Sk1SkDepth(:,1))/25);
                        Sk1SkSpace = Sk1SkSpace(row_idx,:);
                        NumFrameSkelSpace = fix(length(Sk1SkSpace(:,1))/25);

                        % restore 25 joints in groups: ----> load joints in depth and skeleton space:
                        jMatDep = zeros(25, 3, NumFrameSkelDepth);
                        jMatSkl = zeros(25, 3, NumFrameSkelSpace);
                        for n = 1:NumFrameSkelDepth
                            jMatDep(:,:,n) = Sk1SkDepth(((n-1)*25+1):n*25,1:3);
                        end
                        for n = 1:NumFrameSkelSpace
                            jMatSkl(:,:,n) = Sk1SkSpace(((n-1)*25+1):n*25,1:3);
                        end
                        
                        % skeleton matrix
                        complete_skeleton(folder_idx,test_idx,action_name,1:NumFrameSkelSpace,:,:)=permute(jMatSkl,[3 1 2]);
                        
                        % action length matrix
                        action_length(folder_idx,test_idx,action_name)=NumFrameSkelSpace;
            
                    end
                end
            end
        end  
        
        cd('dataset')
        save('TST.mat','complete_skeleton','action_length','number_of_folders','number_of_tests','number_of_actions','number_of_joints','number_of_dimensions','scale_factor');
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
