clear;
close all;
clc;

%%
N = 6;
A=1, B=2, C=3, D=4, E=5, F=6;
H = zeros(N);
H(B, A) = 1
H(E, B) = 1
H(C, B) = 1
H(D, C) = 1
H(C, D) = 1
H(A, E) = 1
H(B, E) = 1
H(F, E) = 1

exits = sum(H);
H = H./exits;
H2 = H;
H(isnan(H)) = 0;

%% a)
H(isnan(H)) = 1/N;
pr = ones(N, 1)/N;
for iter=1:10
    pr = H*pr;
end
pr

%% c) ?????????????
pr = ones(N, 1)/N;
for iter=1:10
    pr = H2*pr;
end