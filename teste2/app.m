clc;
load('data.mat')

while(true)
    ID = input("Insert Valid User ID (0 - 1000): ");
    if ID <= 1000 && ID >= 0
        disp("1 - Your Friends");
        disp("2 - Interests from most similar user");
        disp("3 - Search name");
        disp("4 - Find most similar user based in list of interests");
        disp("5 - Exit");
        choice = input("Select choice: ");
    
        clc;
        switch choice
            case 1
                option1(ID, friendsDic, usersDic);
            case 2
                option2(ID, usersDic, signatures2);
            case 3
                option3(bloomFilter, usersDic, signatures3);
            case 4
                option4(ID, friendsDic, usersDic, signatures4);
            case 5
                disp("Exiting app.");
                clc;
                break
            otherwise
                disp("Invalid choice!");
        end
        fprintf("\nPress any key to continue.");
        pause; clc;
    else
        fprintf("Invalid user ID!\n");
    end
end

function option1(userID, friendsDic, usersDic)
%OPTION1 Lists friends
    friendsList = [string(friendsDic{userID, :})];
    friendsList = rmmissing(friendsList);
    for i = 1:length(friendsList)
        id = friendsList(i);
        name = usersDic{i, 2};
        surname = usersDic{i, 3};
        fprintf("%s %s %s\n", id, name, surname);
    end
end


function option2(ID, usersDic, signatures2)
%OPTION2 Interests from most similar user
    nusers = length(usersDic);
    k = 100;

    % find similarities
    distances = ones(1, nusers);
    for i = 1:nusers
        if i ~= ID
            distances(i) = sum(signatures2(ID, :) ~= signatures2(i, :))/k;
        end
    end
    [~, similarUserID] = min(distances);

    interests = [];
    i = 5;
    while isa(usersDic{ID, i}, 'char')
        interests = [interests string(usersDic{ID, i})];
        i = i + 1;
    end

    similarInterests = [];
    i = 5;
    while isa(usersDic{similarUserID, i}, 'char')
        similarInterests = [similarInterests string(usersDic{similarUserID, i})];
        i = i + 1;
    end

    suggestions = setdiff(interests, similarInterests);

    fprintf('Based on your profile, your most similar user is %s\n', [usersDic{similarUserID, 2} ' ' usersDic{similarUserID, 3}]);
    fprintf('We suggest the following: \n');
    for i = 1:length(suggestions)
        fprintf('%s\n', suggestions(i));
    end
end

function option3(bloomFilter, usersDic, signatures3)
%OPTION3 Search name
    name = lower(input("Write a string: ", 's'));
    bool = checkBloomFilter(name, bloomFilter);
    if bool == 1
        disp('String entered may correspond exactly to an existing name.');
    else
        disp('String entered does not exist in database.');
    end

    nusers = length(usersDic);
    threshold = 0.8;
    shingleSize = 3;
    k = 150; % número funções dispersão
    inputShingles = {};
    for i = 1:length(name) - shingleSize + 1
        shingle = name(i:i + shingleSize - 1);
        inputShingles{i} = shingle;
    end

    inputSignature = inf(1, k);
    for i = 1:length(inputShingles)
        key = char(inputShingles{i});
        hashCodes = zeros(1, k);
        for p = 1:k
            key = [key num2str(p)];
            hashCodes(p) = string2hash(key);
        end
        inputSignature = min([inputSignature; hashCodes]);
    end

    % find similarities
    distances = ones(1, nusers);
    results = 0;
    similarNames = {};
    similarDists = [];
    for i = 1:nusers
       distances(i) = 1 - sum(signatures3(i, :) == inputSignature)/k;
       if distances(i) <= threshold
            results = results + 1;
            similarNames{results} = [usersDic{i, 2} ' ' usersDic{i, 3}];
            similarDists = [similarDists distances(i)];
       end
    end

    [similarDists, sortIndexes] = sort(similarDists); 

    if results == 0
        disp("No results.");
    else
        if results > 7; results = 7; end
        for i = 1:results
            fprintf("%s -> %.3f\n", similarNames{sortIndexes(i)}, similarDists(i));
        end
    end
end

function option4(ID, friendsDic, usersDic, signatures4)
%OPTION4
    option1(ID, friendsDic, usersDic);
    friendID = input("Choose one of your friends: ");

    nusers = length(usersDic);
    k = 100;

    distances = ones(1, nusers);
    for i = 1:nusers
        if i ~= friendID
            distances(i) = 1 - sum(signatures4(friendID, :) ~= signatures4(i, :))/k;
        end
    end

    [~, sortingIndexes] = sort(distances);

    fprintf("\nMost similar users:\n");
    n = 3;
    for i = 1:n
        index = sortingIndexes(i);
        id = usersDic{index, 1};
        name = usersDic{index, 2};
        surname = usersDic{index, 3};
        fprintf("%d %s %s\n", id, name, surname);
    end
end

function bool = checkBloomFilter(m, bloomFilter)
%CHECKBLOOM Check if an element was previously inserted in the filter
%   returns 1 if might have been (because bloom filter)
%   returns 0 if not inserted
    str = m;
    n = length(bloomFilter);
    bool = 1;
    for i = 1:6
        str = [str num2str(i)];
        hCode = mod(string2hash(str), n);
        if bloomFilter(hCode + 1) ~= 1
            bool = 0;
            break
        end
    end
end