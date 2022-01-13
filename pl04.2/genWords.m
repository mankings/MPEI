function words = genWords(N, imin, imax, chars, probs)
%EX1 Summary of this function goes here
%   Detailed explanation goes here
    words = cell(1, N);
    if nargin < 5 % if no probs specified
        for i = 1:N
            l = randi([imin imax], 1);
            v = randi(length(chars), 1, l);
            s = chars(v);
            words(i) = {s};
        end
    else % if probs are specified
        cumSum = cumsum(probs);
    end
end