clear;
close all;
clc;

%% a)
N = 1e5;
media = 14;
desvioPadrao = 2;
classificacoes = media + desvioPadrao.*randn(1, N);
casosFav =  (12 < classificacoes) & (classificacoes < 16);
probA = sum(casosFav)/N

%% b)
N = 1e5;
media = 14;
desvioPadrao = 2;
classificacoes = media + desvioPadrao.*randn(1, N);
casosFav =  (10 < classificacoes) & (classificacoes < 18);
probB = sum(casosFav)/N

%% c)
N = 1e5;
media = 14;
desvioPadrao = 2;
classificacoes = media + desvioPadrao.*randn(1, N);
casosFav =  (10 <= classificacoes);
probC = sum(casosFav)/N