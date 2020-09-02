close all
clear
clc

name_of_actions = {'Balance';'Climb ladder';'Climb up';'Duck';'Hop'; 'Kick'; 'Leap'; 'Punch'; 'Run'; 'Step back'; 'Step front'; 'Step left'; 'Step right'; 'Twist left'; 'Twist right'; 'Vault'};
number_of_actions = length(name_of_actions);

%%%% an example matrix:
example = 1;
if example == 1
    confusion_matrix = rand(number_of_actions) .* 100;
    middleAccuracy = 50;
else
    confusion_matrix = rand(number_of_actions) .* 1;
    middleAccuracy = 0.5;
end
confusion_matrix(3,3) = 0;            %# To illustrate

show_zeros = 1;
X_labels = name_of_actions;
Y_labels = X_labels;
Color_type = 2;   % can be 1 or 2
plot_confusion_matrix(confusion_matrix, show_zeros, X_labels, Y_labels, number_of_actions, middleAccuracy, Color_type);

%%%% rotate xTickLabels:
xticklabel_rotate([1:number_of_actions],45,X_labels,'interpreter','none');