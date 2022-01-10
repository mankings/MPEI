clear;
close all;
clc;

N = 1e5;

%% a)
programasA = 20;
probA = 0.01;
programasB = 30;
probB = 0.05;
programasC = 50;
probC = 0.001;

matrizA = rand(programasA, N) < probA;
matrizB = rand(programasB, N) < probB;
matrizC = rand(programasC, N) < probC;

matriz = [matrizA; matrizB; matrizC];

