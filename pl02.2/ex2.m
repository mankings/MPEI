clear;
close all;
clc;

%% a)

x = 1:100;
prob = ones(size(x))/length(x);

figure;
stem(x, prob);
axis([0 101 0 0.1]);
xlabel("Nota");
ylabel("Probabilidade");
title("Função de massa de probabilidade de cada nota");

temp = [0 prob 0];
cumProb = cumsum(temp);
temp = 0:101;

figure;
stairs(temp, cumProb);
axis([0 101 0 1]);
xlabel("Faces do dado");
ylabel("Probabilidade");
title("Função de distribuição acumulada de cada nota");

%% b)

x = [5 50 100];
casosFav = [90 9 1];
prob = casosFav/sum(casosFav);

figure;
stem(x, prob);
axis([0 101 0 1]);
xlabel("Valor da nota");
ylabel("Probabilidade");
title("Função de massa de probabilidade de cada valor de nota");

%% c)

temp = [0 prob 0];
cumProb = cumsum(temp);
temp = [0 5 50 100 200];

figure;
stairs(temp, cumProb);
axis([0 101 0 1]);
xlabel("Valor da nota");
ylabel("Probabilidade");
title("Função de distribuição acumulada de cada valor de nota");