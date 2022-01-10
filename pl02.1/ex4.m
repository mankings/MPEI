clear;
close all;
clc;

%% a)
N = 1e4;
n = 2:60;

probSimulacao = zeros(1, length(n));
for i = 1:length(n)
    probSimulacao(i) = alvos(365, n(i), N);
end

figure(1);
clf;
plot(n, probSimulacao, 'r.-');
title('Probabilidade de, em n pessoas, duas ou mais terem a mesma data de aniversário');
xlabel('n');
ylabel('prob');