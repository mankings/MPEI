clear;
clc;
close all;

%% ex1
B = BloomFilter(8000);
k = 3;

words = genWords(1000, 3, 10, ['a':'z']);
for i = 1:length(words)
    B = AddToBloom(words{i}, B, k);
end

%% ex2
for i = 1:length(words)
    result = CheckBloom(words{i}, B, k);
    if result == false
        words{i} + 'is a false negative'
        break
    end
end

%% ex3
diffWords = genWords(10000, 3, 10, ['A':'Z']);

falsePositives = 0;
for i = 1:length(diffWords)
    result = CheckBloom(diffWords{i}, B, k);
    if result == true
        falsePositives = falsePositives + 1;
    end
end

prob = falsePositives/10000 * 100