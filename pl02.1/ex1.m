clear;
close all;
clc;

n = 2; %número de filhos
N = 1e5; %número de experiências
pM = 1/2; %probabilidade de filho masculino

%% a) MM MF FM FF
familias = rand(n, N) < pM;
numRapazes = sum(familias) >= 1;
probSimulacao = sum(numRapazes)/N;

%% b) MM MF FM FF
probTeorica = 3/4;

%% c) MM MF FM
probTeorica = 1/3;

familias = rand(n, N) < pM;
pAB = sum(familias) == 2; %probabilidade de 2 rapazes
pB = sum(familias) >= 1; %probabilidade de pelo menos 1 rapaz
probSimulacao = pAB/pB;

%% d) MM MF
familias = rand(n, N) < pM;
novasFam = familias(1, :); %remover uma coluna das famílias, já que o 1º filho é sempre rapaz
numRapazes = sum(novasFam);
probSimulacao = numRapazes/N;

%% e)
n = 5; %número de filhos

familias = rand(n, N) < pM;
pAB = sum(familias) 