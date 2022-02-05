function [users, dic] = createDic(fileName)
%CREATEDIC
    udata = load(fileName);
    data = udata(1:end, 1:2);
    
    users = unique(data(:, 1));
    nusers = length(users);
    
    dic = cell(nusers, 1);
    for n = 1:nusers % constrói dicionário de filmes por utilizador
        ind = find(data(:,1) == users(n));
        dic{n} = [dic{n} data(ind, 2)];
    end
end

