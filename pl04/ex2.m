clear;
close all;
clc;

% generate the keys
N = 1e5;
imin = 6;
imax = 20;
chars = ['a':'z' 'A':'Z'];
words = genWords(1e5, imin, imax, chars, 0);

A = 1;
B = 2;
C = 3;
tablesizes = [5e5; 1e6; 2e6];

collisions = zeros(3, 4);
times = zeros(3, 4);
%% djb2 (1)
[hCodesA1, countA1, collisions(A, 1), times(A, 1)] = simulateInsertion(words, tablesizes(1), @string2hash, 'djb2');

%% sdbm (2)

%% hashstring (3)

%% DJB31MA (4)