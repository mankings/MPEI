clear;
close all;
clc;

%% ex1

% método 1
experiencias = rand(3, 10000);
lancamentos = experiencias > 0.5;
resultados = sum(lancamentos);
sucessos = resultados == 2;
probSimulacao = sum(sucessos)/10000

clear;
% método 2

N = 1e5; % número de experiências
p = 0.5; % probabilidade de cara
k = 2; % número de caras
n = 3; % número de lançamentos
lancamentos = rand(n, N) > p;
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos)/N