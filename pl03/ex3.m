clear;
close all;
clc;

T = rand(20);
T = T./sum(T);

%% a)
sum(T);

%% b)
v0 = zeros(20, 1);
v0(1) = 1;

v2 = T^(2-1)*v0;
v2(20)
v5 = T^(5-1)*v0;
v5(20)
v10 = T^(10-1)*v0;
v10(20)
v100 = T^(100-1)*v0;
v100(20)