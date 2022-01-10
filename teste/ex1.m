clear;
close all;
clc;

%% a)
N = 6;
A=1, B=2, C=3, D=4, E=5, F=6;
H = zeros(N);
H(F, A) = 1
H(E, A) = 1
H(B, A) = 1
H(D, A) = 1
H(C, B) = 1
H(D, B) = 1
H(B, C) = 1
H(C, D) = 1
H(A, E) = 1
H(B, E) = 1
H(D, E) = 1
H(F, E) = 1

exits = sum(H);
H = H./exits;
H(isnan(H)) = 0;

%% b)
pr = ones(N, 1)/N;
for iter=1:10
    pr = H*pr;
end
pr

%% d)
p = 0.9;
A = p*H+(1-p)*ones(N)/N;
A(isnan(A))=1/N;
pr = ones(N, 1)/N;
for iter=1:10
    pr = A*pr;
end
pr