clear;
close all;
clc;

%% a)

%problem 1
prob1 = probCalc(2, 3, 1e5, 0.5)

clear;
%problem 2
prob2 = probCalc(6, 15, 1e5, 0.5)

clear;
%problem 3
prob3 = 0;
k = 6;
n = 15;
for i = k:n
    prob3 = prob3 + probCalc(i, n, 1e5, 0.5);
end
prob3

clear;
%problem 4
prob4_20 = zeros(1, 21);
for i = 0:20
    prob4_20(i+1) = probCalc(i, 20, 1e5, 0.5);
end

prob4_40 = zeros(1, 41);
for i = 0:40
    prob4_40(i+1) = probCalc(i, 40, 1e5, 0.5);
end

prob4_100 = zeros(1, 101);
for i = 0:100
    prob4_100(i+1) = probCalc(i, 100, 1e5, 0.5);
end

stem(prob4_20)