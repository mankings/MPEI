clear;
close all;
clc;

lambda = 0.02*100;
poisson = 0;

for k = 0:1
    poisson = poisson + ((lambda^k)/factorial(k))*exp(1)^(-lambda);
end
poisson