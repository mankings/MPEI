clear;
clc;
close all;

kList = [4 5 6 7 8 9 10];
prob = zeros(size(kList));
words = genWords(1000, 3, 10, ['a':'z']);
diffWords = genWords(10000, 3, 10, ['A':'Z']);

for i = 1:length(kList)
    k = kList(i);
    B = BloomFilter(8000);
    

    for j = 1:length(words)
        B = AddToBloom(words{j}, B, k);
    end
    
    falsePositives = 0;
    for j = 1:length(diffWords)
        result = CheckBloom(diffWords{j}, B, k);
        if result == true
            falsePositives = falsePositives + 1;
        end
    end

    prob(i) = falsePositives/10000;
end

figure(1);
plot(kList, prob, 'r.-');
xlabel('k');
ylabel('prob falsePositives');
title('Prob falsePositives por k');
grid on;

kOtimo = 8000/1000 * log(2)