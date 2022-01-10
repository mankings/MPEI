clear;
close all;
clc;

N = 1e4;

%% a)
probSimulacao = alvos(alvos, dardos, N);

%% b)
probSimulacao = 1 - probSimulacao

%% c)
dardos = 10:10:100;
alvos = 1000;

prob1000 = zeros(1, length(dardos));
for i = 1:length(prob1000)
    prob1000(i) = alvos(alvo, dardos(i), N);
end

alvos = 10000;
prob10000 = zeros(1, length(dardos));
for i = 1:length(prob10000)
    prob10000(i) = alvos(alvo, dardos(i), N);
end

figure(1);
clf;
subplot(1, 2, 1);
plot(dardos, prob1000, 'r.-');
title('1000 alvos');
xlabel('Número de dardos');
ylabel('Probabilidade');

subplot(1, 2, 2);
plot(dardos, prob10000, 'b.-');
title('10000 alvos');

sgtitle('Probabilidade de pelo menos 1 alvo ser atingido 2 ou mais vezes')

%% d)
dardos = 100;
alvos = [200 500 1000 2000 10000 20000 50000 100000];

probSimulacao = zeros(1, length(alvos));
for i = 1:length(alvos)
    acertos = randi([1 alvos(i)], dardos, N);
    casos = zeros(1, N);
    for k = 1:N
        casos(k) = length(unique(acertos(:, k))) ~= dardos;
    end
    casosFav = sum(casos);
    probSimulacao(i) = casosFav/N;
end

figure;
clf;
plot(alvos, probSimulacao, 'r.-');
title('Probabilidade de pelo menos 1 alvo ser atingido 2 ou mais vezes -- 100 dardos');