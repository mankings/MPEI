function B = AddToBloom(m, B, k)
%ADDTOBLOOM Add an element to the bloom filter
% Uses string2hash
    str = m;
    n = length(B);
    for i = 1:k
        str = [str num2str(i)];
        hCode = mod(string2hash(str), n);
        B(hCode + 1) = 1;
    end
end