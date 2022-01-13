function bool = CheckBloom(m, B, k)
%CHECKBLOOM Check if an element was previously inserted in the filter
%   returns 1 if might have been (because bloom filter)
%   returns 0 if not inserted
    str = m;
    n = length(B);
    bool = true;
    for i = 1:k
        str = [str num2str(i)];
        hCode = mod(string2hash(str), n);
        if B(hCode + 1) ~= 1
            bool = false;
            break
        end
    end
end