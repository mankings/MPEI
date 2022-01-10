clear;
close all;
clc;

%% a)
n = 8000;
k = 7;
prob = 1/1000;

binomial = nchoosek(8000, 7)*prob^k*(1-prob)^(n-k);

%% b)
lambda = n*prob;
poisson = ((lambda^k)/factorial(k))*exp(1)^(-lambda);