clear;
close all;
clc;

%% a)
k = 0;
lambda = 15;

poisson = ((lambda^k)/factorial(k))*exp(1)^(-lambda)

%% b)
lambda = 15;
poisson = 0;
for k = 0:10
    poisson = poisson + ((lambda^k)/factorial(k))*exp(1)^(-lambda);
end
poisson = 1 - poisson