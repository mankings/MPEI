clc;
close all;
clear;

%% a)
% Aveiro Porto Minho Lisboa Madeira
T = [ 7   0  1 2/3 4.8
      1.5 10 1 2/3 2.4
      0   0  6 0   0 
      1.5 0  1 8   0.8 
      0   0  1 2/3 2
    ]/10;

%% b) 
v0 = [1; 0; 0; 0; 0];
v10 = T^(10-1)*v0

%% c)
v0 = [0; 0; 1; 0; 0];
v4 = T^(4-1)*v0

v1000 = T^(1000-1)*v0
