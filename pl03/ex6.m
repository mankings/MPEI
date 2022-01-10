clear;
close all;
clc;

%% a)
%ordem: 1, 2, 4,     3, 5
T = [ 8 0 3 0 0
    2 6 2 0 0
    0 1 4 0 0
    0 3 0 10 0
    0 0 1 0 10]/10;

%% b)
N = 100;
v0 = [1; 0; 0; 0; 0];
v = zeros(5, N);
for n = 1:N
    v(:, n) = T^n*v0;
end

n = 1:100;
figure(1);
plot(n, v(2, :), 'bo:');
title("Prob de estar no estado 2 ao fim de n passos");
xlabel("n");
ylabel("prob");
grid on;

%% c)
v0 = [1; 0; 0; 0; 0];
v = zeros(5, 100);
for n = 1:100
    v(:, n) = T^n*v0;
end

n = 1:100;
figure(2);
subplot(2, 1, 1);
plot(n, v(4, :), 'bo:');
title("Prob de estar no estado 3 ao fim de n passos");
xlabel("n");
ylabel("prob");
grid on;
subplot(2, 1, 2);
plot(n, v(5, :), 'bo:');
title("Prob de estar no estado 5 ao fim de n passos");
xlabel("n");
ylabel("prob");
grid on;

%% d)
nena=3;
Q = T(1:nena, 1:nena);

%% e)
F = inv(eye(size(Q))-Q);

%% f) ????????????