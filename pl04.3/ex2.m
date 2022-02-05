clear;
close all;
clc;

%% process data
[users, dic] = createDic('u.data');

%% jaccard distances by definition
distances = calcJaccardDistances(users, dic);

% time - 154.380505 seconds

%% pairs below threshold
similarUsers = getSimilarUsers1(0.4, users, distances);