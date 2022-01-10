function words = genWords(N, imin, imax, chars, probs)
%EX1 Summary of this function goes here
%   Detailed explanation goes here
    
    words = cell(1, N);
    for i = 1:N
        l = randi([imin imax], 1);
        v = randi(length(chars), 1, l);
        s = chars(v);
        words(i) = {s};
    end
end