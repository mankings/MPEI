usersDic = readcell('utilizadores.txt', 'Delimiter', ';');

friends = load('amigos.txt');
friends = friends(1:end,1:2);
users = unique(friends(:,1));
nusers = length(users);
friendsDic = cell(nusers,1);
for n = 1:nusers
  ind = find(friends(:,1) == users(n));
  friendsDic{n} = [friendsDic{n} friends(ind,2)];
end

bloomFilter = setupBloomFilter(8000, usersDic);
signatures2 = minHash2(friendsDic, usersDic);
signatures3 = minHash3(usersDic);
signatures4 = minHash4(usersDic);

save("data.mat", "usersDic", "friendsDic", "bloomFilter", "signatures2", "signatures3", "signatures4");

function signatures2 = minHash2(friendsDic, usersDic)
    nusers = length(usersDic);
    % minHash function
    k = 100; % número de funções de dispersão
    
    h = waitbar(0, "Loading signatures2...");
    signatures2 = inf(nusers, k);
    for i = 1:nusers
        waitbar(i/nusers, h);
        friends = [friendsDic{i, :}];
        friends = rmmissing(friends);
        ages = zeros(length(friends), 1);
        for j = 1:length(friends)
            ages(j) = usersDic{friends(j), 4};
            key = char(ages(j));
            hashCodes = zeros(1, k);
            for p = 1:k
                key = [key num2str(p)];
                hashCodes(p) = string2hash(key);
            end
            signatures2(i, :) = min([signatures2(i, :); hashCodes]);
        end
    end
    delete(h);
end

function signatures3 = minHash3(usersDic)
    nusers = length(usersDic);
    % minHash function
    k = 150;
    shingleSize = 3;
    h = waitbar(0, "Loading signatures3...");
    signatures3 = inf(nusers, k);
    for i = 1:nusers
        waitbar(i/nusers, h);
        name = lower([usersDic{i, 2} ' ' usersDic{i, 3}]);
        for j = i:length(name) - shingleSize + 1
            shingle = name(j:j + shingleSize - 1);
            shingles{j} = shingle;
        end

        for j = 1:length(shingles)
            key = char(shingles{j});
            hash = zeros(1, k);
            for p = 1:k
                key = [key num2str(p)];
                hash(p) = string2hash(key);
            end
            signatures3(i, :) = min([signatures3(i, :); hash]); 
        end
    end
    delete(h);
end

function signatures4 = minHash4(usersDic)
    nusers = length(usersDic);
    % minHash function
    k = 100;
    
    h = waitbar(0, "Loading signatures4...");
    signatures4 = inf(nusers, k);
    for i = 1:nusers
        waitbar(i/nusers, h);
        interests = [usersDic{i, :}];
        interests = rmmissing(interests);
        for j = 1:length(interests)
            key = char(interests(j));
            hash = zeros(1, k);
            for p = 1:k
                key = [key num2str(p)];
                hash(p) = string2hash(key);
            end
            signatures4(i, :) = min([signatures4(i, :); hash]);
        end
    end
    delete(h);
end

function bloomFilter = setupBloomFilter(n, usersDic)
%SETUPBLOOMFILTER of the names
    bloomFilter = zeros(1, n, 'uint8');
    for i = 1:length(usersDic)
        name = [usersDic{i, 2} ' ' usersDic{i, 3}];
        for j = 1:6
            name = [name num2str(j)];
            hCode = mod(string2hash(name), n);
            bloomFilter(hCode + 1) = 1;
        end
    end
end