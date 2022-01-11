function [hCodes, count, collisions, time] = simulateInsertion(words, tablesize, func, arg)
%simulateInsertion
%   Função auxiliar ao exercício, simula a inserção das keys na chaining
%   hash table.
%   
%   words - cell array de keys
%   tablesize - hash table size
%   func - função a utilizar para gerar os hash codes
%   arg - 2o argumento da função utilizada.
%       string2hash - either 'djb2' or 'sdbm'
%       hashstring - hash table size
%       DJB31MA - seed

% isto provavelmente está na merda
    tic;
    n = tablesize; % table size
    hCodes = zeros(1, n);
    count = zeros(1, n);
    for i = 1:length(words)
        key = words{i};
        hCode = mod(func(key, arg), n);
        hCodes(key) = hCode; % a)
        count(hCode) = count(hCode) + 1; % b)
    end
    collisions = sum(sum(count) - 1); % c)
    time = toc; % d)
end

