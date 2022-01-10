clear;
clc;
close all;

%% a)
N = 1e5;
probDefeito = 0.3;
matriz = rand(5, N) < probDefeito;
probs = zeros(0, 6);
for i = 1:6
    probs(i) = sum(sum(matriz) == i-1)/N
end

figure;
n = 0:5;
stem(n, probs);