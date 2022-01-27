function [hCodes, contagem, collisions, time] = simulateInsertion(words, tablesize, func, arg)
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

    tic;
    key = words{1};
    hCode = mod(func(key, arg), tablesize);
    hCodes = hCode;
    contagem = zeros(n, 1);
    for i = 2:length(words)
        key = words{i};
        hCode = mod(func(key, arg), tablesize);
        if ~ismember(hCodes, hCode)
            hCodes = [hCodes; hCode];
        end
        contagem(hCode) = contagem(hCode) + 1;
    end
    collisions = sum(sum(contagem) - 1);
    time = toc;
end

