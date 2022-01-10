clear;
close all;

%% a)

dado = [1 2 3 4 5 6]
prob = ones(size(dado))/6;

figure;
stem(dado, prob);
axis([0 7 0.1 0.2]);
xlabel("Faces do dado");
ylabel("Probabilidade");
title("Função de massa de probabilidade de um dado equilibrado");

%% b)

temp = [0 prob 0];
cumProb = cumsum(temp);
temp = 0:7;

figure;
stairs(temp, cumProb);
axis([0 7 0 1]);
xlabel("Faces do dado");
ylabel("Probabilidade");
title("Função de distribuição acumulada de um dado equilibrado");