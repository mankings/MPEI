function distances = calcJaccardDistances(users, dic)
%CALCJACCARDDISTANCES
    nusers = length(users);
    distances = zeros(nusers);
    h = waitbar(0, 'Calculating Jaccard distances of all pairs');
    disp('Calculation Jaccard distances of all pairs...')
    tic
    for n1 = 1:nusers
        waitbar(n1/nusers, h);
        for n2 = 1:nusers
            i = intersect(dic{n1}, dic{n2});
            u = union(dic{n1}, dic{n2});
            distances(n1, n2) = 1 - (length(i)/length(u));
        end
    end
    delete(h)
    toc
    
    save('distances.mat', 'distances');
end

