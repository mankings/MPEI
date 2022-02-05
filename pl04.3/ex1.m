clear;
close all;
clc;

%% process data
udata = load('u.data');
data = udata(1:end,1:2);

users = unique(data(:, 1));
nusers = length(users);

set = cell(nusers, 1);
for n = 1:nusers % constrói dicionário de filmes por utilizador
    ind = find(data(:,1) == users(n));
    set{n} = [set{n} data(ind, 2)];
end

%% jaccard distances by definition

distances = zeros(nusers);
h = waitbar(0, 'Calculating Jaccard distances of all pairs');
disp('Calculation Jaccard distances of all pairs...')
tic
for n1 = 1:nusers
    waitbar(n1/nusers, h);
    for n2 = 1:nusers
        i = intersect(set{n1}, set{n2});
        u = union(set{n1}, set{n2});
        distances(n1, n2) = 1 - (length(i)/length(u));
    end
end
delete(h)
toc

save('distances.mat', 'distances');

%% pairs below threshold
threshold = 0.4;

similarUsers = zeros(1, 3);
k = 1;
disp('Similar Users:');
tic
for n1 = 1:nusers
    for n2 = 1:nusers
        if distances(n1, n2) < threshold && n1 ~= n2
            similarUsers(k, :) = [users(n1) users(n2) distances(n1, n2)];
            k = k + 1;
            fprintf(1, '%d %d %d\n', users(n1), users(n2), distances(n1, n2));
        end
    end
end
toc