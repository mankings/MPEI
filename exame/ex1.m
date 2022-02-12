clc;
close all;
clear;

%% a)
N = 1e6;
casos = [0 1 2 3 4 5];

matriz = rand(5, N) < 0.002;
defeitos = sum(matriz);
fmp = zeros(size(casos));
for i = 0:5
    fmp(i+1) = sum(defeitos == i);
end
fmp = fmp/N

%% b)
E = 0;
for i= 1:6
  E = E + (i-1) * fmp(i);
end
E

E2 = 0;
for i = 1:6
    E2 = E2 + (i-1)^2 * fmp(i);
end

var = E2 - E^2;

dp = sqrt(var)