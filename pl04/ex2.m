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
[hCodesA1, countA1, collisions(A, 1), times(A, 1)] = simulateInsertion(words, tablesizes(A), @string2hash, 'djb2');
[hCodesB1, countB1, collisions(B, 1), times(B, 1)] = simulateInsertion(words, tablesizes(B), @string2hash, 'djb2');
[hCodesC1, countC1, collisions(C, 1), times(C, 1)] = simulateInsertion(words, tablesizes(C), @string2hash, 'djb2');
%% sdbm (2)
[hCodesA2, countA2, collisions(A, 2), times(A, 2)] = simulateInsertion(words, tablesizes(A), @string2hash, 'sdbm');
[hCodesB2, countB2, collisions(B, 2), times(B, 2)] = simulateInsertion(words, tablesizes(B), @string2hash, 'sdbm');
[hCodesC2, countC2, collisions(C, 2), times(C, 2)] = simulateInsertion(words, tablesizes(C), @string2hash, 'sdbm');

%% hashstring (3)
[hCodesA3, countA3, collisions(A, 3), times(A, 3)] = simulateInsertion(words, tablesizes(A), @hashstring, tablesizes(A));
[hCodesB3, countB3, collisions(B, 3), times(B, 3)] = simulateInsertion(words, tablesizes(B), @hashstring, tablesizes(B));
[hCodesC3, countC3, collisions(C, 3), times(C, 3)] = simulateInsertion(words, tablesizes(C), @hashstring, tablesizes(C));

%% DJB31MA (4)
[hCodesA4, countA4, collisions(A, 4), times(A, 4)] = simulateInsertion(words, tablesizes(A), @DJB41MA, words{1});
[hCodesB4, countB4, collisions(B, 4), times(B, 4)] = simulateInsertion(words, tablesizes(B), @DJB41MB, words{1});
[hCodesC4, countC4, collisions(C, 4), times(C, 4)] = simulateInsertion(words, tablesizes(C), @DJC41MC, words{1});