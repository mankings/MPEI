clear;
close all;
clc;

%% a)

N = 1e6;
casos = [0 1 2 3 4];

lancamentos = rand(4, N) < 0.5;
coroas = sum(lancamentos);
count = zeros(size(casos));
for i = 0:4
    count(i+1) = sum(coroas == i);
end
prob = count/sum(count);

figure;
stem(casos, prob);
axis([-1 5 0 1]);
xlabel("Número de coroas");
ylabel("Probabilidade");
title("Função massa de probabilidade do número de coroas em 4 lançamentos de uma moeda");