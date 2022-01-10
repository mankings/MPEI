clear;
close all;
clc;

%% a)
T = [0.2 0.3
    0.8 0.7];

v0 = [0; 1];
v1 = T*v0;
v2 = T*v1;

prob = v2(2, 1)

%% b)
v0 = [1; 0];
v1 = T*v0;
v2 = T*v1;

prob = v2(2, 1)

%% c)
v0 = [0; 1];
n = 30;
vn = T^(n-1)*v0;

prob = vn(2,1)

%% d)
v0 = [0; 0.85];
n = 30;
faltas = zeros(1, n);
for i = 1:n
    vn = T^(i-1)*v0;
    faltas(1, i) = vn(1, 1);
end

figure(1);
plot(1:30, faltas);
grid on;
xlabel("Dias");
ylabel("Probabilidade")
title("Probabilidade de faltar a cada aula");