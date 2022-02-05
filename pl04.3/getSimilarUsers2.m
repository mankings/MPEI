function similarUsers = getSimilarUsers2(threshold, users, signatures)
%GETSIMILARUSERS2 (using signatures matrix)
    nusers = length(users);
    threshold = 1 - threshold; % because we are using similarity, not distance

    similarUsers = zeros(1, 3);
    k = 1;
    disp('Similar Users:');
    tic
    for n1 = 1:users
        for n2 = n1+1:users
            similarity = sum(signatures(:, n1) == signatures(:, n2))/100;
            if similarity > threshold
                distance = 1 - similarity;
                similarUsers(k, :) = [users(n1) users(n2) distance];
                k = k + 1;
                fprintf(1, '%d %d %d\n', users(n1), users(n2), distance);
            end
        end
    end
    toc
end

