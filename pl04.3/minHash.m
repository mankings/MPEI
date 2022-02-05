function signatures = minHash(dic)
%MINHASH
    dicLength = length(dic);
    nHash = 100;
    prime = 100103;
    aVals = randi([1, (prime-1)], 1, nHash);
    bVals = randi([1, (prime-1)], 1, nHash);

    signatures = zeros(nHash, dicLength);

    h = waitbar(0, 'Building signatures matrix');
    for i = 1:dicLength
        waitbar(i/dicLength, h);
        for j = 1:nHash
            hK = zeros(length(dic(i)));
            for k = 1:length(dic(i))
                hK(k) = mod(aVals(j) * dic{i}(k) + bVals(j), prime);
            end
            signatures(j, i) = min(hK);
        end
    end
    delete(h);
end

