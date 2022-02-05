function similarUsers = getSimilarUsers1(threshold, users, distances)
%GETSIMILARUSERS1 (using distances)
    nusers = length(users);
    similarUsers = zeros(1, 3);
    k = 1;
    disp('Similar Users:');
    tic
    for n1 = 1:nusers
        for n2 = n1+1:nusers
            if distances(n1, n2) < threshold
                similarUsers(k, :) = [users(n1) users(n2) distances(n1, n2)];
                k = k + 1;
                fprintf(1, '%d %d %d\n', users(n1), users(n2), distances(n1, n2));
            end
        end
    end
    toc
end

