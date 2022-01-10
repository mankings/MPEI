clear;
close all;
clc;

%% a)
N = 1e5;
T = 1000;
keys = 10;

probSimulacao = alvos(T, keys, N);

%% c)
keys = 50;
T = 100:100:1000;

probSimulacao = zeros(1, length(T));
for i = 1:length(T)
    probSimulacao(i) = alvos(T(i), keys, N);
end

figure(1);
clf;
plot(T, probSimulacao, 'r.-');
xlabel('T');
ylabel('probSimulacao');