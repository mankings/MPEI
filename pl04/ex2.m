clear;
close all;
clc;

%% a)
N = 1e5;
imin = 6;
imax = 20;
chars = ['a':'z' 'A':'Z'];
words = genWords(1e5, imin, imax, chars, 0);

hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = mod(string2hash(key), n) + 1;
    hCodes(key) = hCode;
    count(hCode) = count(hCode) + 1;
end