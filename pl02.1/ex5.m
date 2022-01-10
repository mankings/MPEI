clear;
close all;
clc;

N = 1e5;

%% a)
% acontecimento A
lancamentos = randi(6, 2, N);
casosFav = sum(lancamentos) == 9;
probA = sum(casosFav)/N

% acontecimento B
lancamentos = randi(6, 2, N);
lancamentos(1, :) = [];
casosFav = rem(lancamentos, 2) == 0;
probB = sum(casosFav)/N

% acontecimento C
lancamentos = randi(6, 2, N);
casosFav = lancamentos == 5;
probC = sum(sum(casosFav) >= 1)/N

% acontecimento D
lancamentos = randi(6, 2, N);
casos = lancamentos ~= 1;
casosFav = sum(lancamentos) == 2;
probD = sum(casosFav)/N


