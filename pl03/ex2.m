clear;
close all;
clc;

%% a)
T = [1/3 1/4 0
    1/3 11/20 1/2
    1/3 1/5 1/2]

sum(T)

%% b) e c)
v0 = [60; 15; 15];
v30 = T^(30-1)*v0

%% d)
v0 = [30; 30; 30];
v30 = T^(30-1)*v0