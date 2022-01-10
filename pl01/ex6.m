clear;
close all;
clc;

%% a)
prob_a = probCalc(3, 5, 1e5, 0.7)

clear;
%% b)
prob_b = 0;
for i = 0:2
    prob_b = prob_b + probCalc(i, 5, 1e5, 0.7);
end
prob_b

clear;
%% c)
prob_c = zeros(1, 6);
for i = 0:5
    prob_c(i+1) = probCalc(i, 5, 1e5, 0.7);
end
prob_c
histogram(prob_c);