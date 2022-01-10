clear;
close all;
clc;

%% b)
% C A S O FIM
% 1 2 3 4  5
T = [0 1 0 1 0
    1 0 1 0 0
    0 1 0 1 0
    1 0 1 0 0
    0 1 1 1 0];

T = T./sum(T);
T(isnan(T)) = 0;
T

%% c)
start = randi(4, 1, 1);
last = 5
str = crawl(T, start, last)

%% d)
prob = 1/4 * T(2, 1) * T(3, 2) * T(2, 3) * T(5, 2)

%% e)
N = 1e5;
words = cell(1, N);
last = 5;
for i = 1:N
    start = randi(4, 1, 1);
    str = crawl(T, start, last);
    str = string(str);
    str = strjoin(str);
    words(1, i) = {str};
end

words = string(words);
uniqueWords = unique(words);

prob = zeros(size(uniqueWords));
for i = 1:length(uniqueWords)
    str = uniqueWords(1, i);
    occurences = (words == str);
    prob(1, i) = sum(occurences)/N;
end

%% f)
wordCount = length(uniqueWords)
[M, I] = maxk(prob, 5);
for i = 1:5
    uniqueWords(I(i))
    prob(I(i))
end

%% g)
temp = find(uniqueWords == '1 2 3 2 5');
prob(1, temp)

%% h)
total = 0;
count = 0
for i = 1:N
    str = words(i);
    if(startsWith(str, '3'))
         length = ceil(strlength(str)/2);
         total = total + length;
         count = count + 1;
    end
end

mean = total/count

%% functions
function state = crawl(H, first, last)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     state = [first];
     % keep moving from state to state until state "last" is reached:
     while (1)
          state(end+1) = nextState(H, state(end));
          if (state(end) == last)
              break;
          end
     end
end

function state = nextState(H, currentState)
     % find the probabilities of reaching all states starting at the current one:
     probVector = H(:,currentState)';  % probVector is a row vector 
     n = length(probVector);  %n is the number of states
     % generate the next state randomly according to probabilities probVector:
     state = discrete_rnd(1:n, probVector);
end

function state = discrete_rnd(states, probVector)
     U=rand();
     i = 1 + sum(U > cumsum(probVector));
     state= states(i);
end