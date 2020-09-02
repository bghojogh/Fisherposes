function mean_histogram_1D = Train_Motion_Histograms(test_person)

global name_of_actions;
global action_length;
global frame_step;
global frame_step_inMotion;
global number_of_actions;
global number_of_persons;
global number_of_samples;
global motive_joint_index;
global display_motion_vectors_EVERY_PERFORMANCE;
global display_histogram_EVERY_PERFORMANCE;
global display_histogram_TOTAL_ACTIONS;

%%%% pre-allocation of histogram:
Histogram_stack = cell(number_of_actions,1);
motion_vector_stack = cell(number_of_actions,1);
%%%% histogram:
for which_person = 1:number_of_persons
    if which_person ~= test_person
        for which_action = 1:number_of_actions
            number_of_performances = number_of_samples(which_person,which_action);
            for which_performance = 1:number_of_performances
                %%%% finding motion vectors in frames:
                frames = 1:frame_step_inMotion:action_length(which_person,which_performance,which_action);
                motion_vector = zeros(length(frames)-1, 3);
                motive_joint = zeros(length(frames), 3);
                counter = 0;
                for frame = frames
                    %%%% load the motive joint:
                    motive_joint(frame,:) = load_the_motive_joint(which_person,which_performance,which_action,frame,motive_joint_index);
                    %%%% calculate the motion vector:
                    if frame ~= 1
                        counter = counter + 1;
                        motion_vector(counter,:) = motive_joint(frame,:) - motive_joint(frame-1,:);
                    end
                end
%                 %%%% display the motion vectors:
%                 if display_motion_vectors_EVERY_PERFORMANCE == 1
%                     if which_action == 10
%                         figure
%                         plot_3D_motion_vectors(motive_joint);
%                         input('Enter a key to continue: ');
%                         close all
%                     end
%                 end
                %%%% display the motion vectors:
                if display_motion_vectors_EVERY_PERFORMANCE == 1
                    if (which_action == 5 || which_action == 10 || which_action == 11 || which_action == 12 || which_action == 13) && which_person == 10 && which_performance == 1
                        %figure
                        %plot_3D_motion_vectors(motive_joint);
                        if which_action == 5
                            p1 = plot3(motive_joint(:,1), motive_joint(:,3), motive_joint(:,2), '-ob', 'MarkerFaceColor', 'b', 'MarkerSize', 5);
                        elseif which_action == 10
                            p2 = plot3(motive_joint(:,1), motive_joint(:,3), motive_joint(:,2), '-or', 'MarkerFaceColor', 'r', 'MarkerSize', 5);
                        elseif which_action == 11
                            p3 = plot3(motive_joint(:,1), motive_joint(:,3), motive_joint(:,2), '-ok', 'MarkerFaceColor', 'k', 'MarkerSize', 5);
                        elseif which_action == 12
                            p4 = plot3(motive_joint(:,1), motive_joint(:,3), motive_joint(:,2), '-og', 'MarkerFaceColor', 'g', 'MarkerSize', 5);
                        elseif which_action == 13
                            p5 = plot3(motive_joint(:,1), motive_joint(:,3), motive_joint(:,2), '-om', 'MarkerFaceColor', 'm', 'MarkerSize', 5);
                        end
                        xlim([-40,40]);
                        ylim([-40,40]);
                        %zlim([-10,40]);
                        hold on
                    end
                    if (which_action == 13) && which_person == 10 && which_performance == 1
                        leg = legend([p1,p2,p3,p4,p5],{'Hop', 'Step back', 'Step front', 'Step left', 'Step right'});
                        %leg = legend([p1,p2,p3,p4,p5],{'Hop', 'Step right', 'Step left', 'Step back', 'Step front'});
                        set(leg, 'Location', 'northeast');
                        xlabel('x');
                        ylabel('z');
                        zlabel('y');
                        grid on
                        input('Enter a key to continue: ');
                        close all
                    end
                end
                %%%% save the motion_vector:
                motion_vector_stack{which_action}{end+1}(:,:) = motive_joint;
                %%%% histogram:
                [Histogram_1D, Histogram_2D] = Calculate_Histogram(motive_joint(2:end,:));  % notice: 2:end because we remove the redundant first frame (which is in origin)
                %%%% display the histogram:
                if display_histogram_EVERY_PERFORMANCE == 1
                    if which_action == 10
                        figure
                        view(3)
                        bar3(Histogram_2D);
                        input('Enter a key to continue: ');
                        close all
                    end
                end
                %%%% save the histogram:
                Histogram_stack{which_action}{end+1}(:,:) = Histogram_2D;
            end
        end
    end
end

%% finding mean histograms:
for which_action = 1:number_of_actions
    sum_histograms = 0;
    for i = 1:length(Histogram_stack{which_action})
        sum_histograms = sum_histograms + Histogram_stack{which_action}{i};
    end
    mean_histogram_2D(:,:,which_action) = sum_histograms ./ length(Histogram_stack{which_action});
    mean_histogram_1D(which_action,:) = reshape(mean_histogram_2D(:,:,which_action)', 1, []);
end

%% display the histograms:
if display_histogram_TOTAL_ACTIONS == 1
    figure
    for which_action = 1:number_of_actions
        subplot(ceil(number_of_actions/4),4,which_action);
        view(3)
        bar3(mean_histogram_2D(:,:,which_action));
        title(name_of_actions(which_action));
    end
    
    figure
    imagesc(mean_histogram_1D);
    %colormap(mymap);
    colormap(flipud(gray))
    colorbar();
    ylabel('Action');
    xlabel('Bins');
    
    figure
    view(3)
    bar3(mean_histogram_1D);
    ylabel('Action');
    xlabel('Bins');
    zlabel('Distribution');
    set(gca,'YTickLabel',name_of_actions,'XTick',1:number_of_actions);
    
    figure
    for which_action = 1:number_of_actions
        subplot(ceil(number_of_actions/4),4,which_action);
        hold on
        for i = 1:length(motion_vector_stack{which_action})
            plot_3D_motion_vectors(motion_vector_stack{which_action}{i}(:,:));
        end
        hold off
        title(name_of_actions(which_action));
    end
    
    input('Enter a key to continue: ');
    close all
end

end