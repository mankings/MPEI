clear;
close all;
clc;

%% process data
[users, dic] = createDic('u.data');

%% jaccard distances by minhash
signatures = minHash(dic);

%% pairs below threshold
similarUsers = getSimilarUsers2(0.4, users, signatures);