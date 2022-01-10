clear;
close all;
clc;

% generate the keys
N = 1e5;
imin = 6;
imax = 20;
chars = ['a':'z' 'A':'Z'];
words = genWords(1e5, imin, imax, chars, 0);

A = 5e5;
B = 1e6;
C = 2e6;

%% djb2
tic;
n = A; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = mod(string2hash(key, djb2), n) + 1;
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Adjb2 = hCodes;
count_Adjb2 = count;
collisions_Adjb2 = collisions;
time_Adjb2 = time;

tic;
n = B; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = mod(string2hash(key, djb2), n) + 1;
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Bdjb2 = hCodes;
count_Bdjb2 = count;
collisions_Bdjb2 = collisions;
time_Bdjb2 = time;

tic;
n = C; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = mod(string2hash(key, djb2), n) + 1;
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Cdjb2 = hCodes;
count_Cdjb2 = count;
collisions_Cdjb2 = collisions;
time_Cdjb2 = time;

%% sdbm
tic;
n = A; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = mod(string2hash(key, sdbm), n) + 1;
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Asdbm = hCodes;
count_Asdbm = count;
collisions_Asdbm = collisions;
time_Asdbm = time;

tic;
n = B; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = mod(string2hash(key, sdbm), n) + 1;
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Bsdbm = hCodes;
count_Bsdbm = count;
collisions_Bsdbm = collisions;
time_Bsdbm = time;

tic;
n = C; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = mod(string2hash(key, sdbm), n) + 1;
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Csdbm = hCodes;
count_Csdbm = count;
collisions_Csdbm = collisions;
time_Csdbm = time;

%% hashstring
tic;
n = A; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = hashstring(key, n);
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Ahashstring = hCodes;
count_Ahashstring = count;
collisions_Ahashstring = collisions;
time_Ahashstring = time;

tic;
n = B; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = hashstring(key, n);
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Bhashstring = hCodes;
count_Bhashstring = count;
collisions_Bhashstring = collisions;
time_Bhashstring = time;

tic;
n = C; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = hashstring(key, n);
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Chashstring = hCodes;
count_Chashstring = count;
collisions_Chashstring = collisions;
time_Chashstring = time;

%% DJB31MA
tic;
n = A; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = DJB31MA(key, n);
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Ahashstring = hCodes;
count_Ahashstring = count;
collisions_Ahashstring = collisions;
time_Ahashstring = time;

tic;
n = B; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = hashstring(key, n);
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Bhashstring = hCodes;
count_Bhashstring = count;
collisions_Bhashstring = collisions;
time_Bhashstring = time;

tic;
n = C; % table size
hCodes = zeros(1,N);
count = zeros(1,N);
for i = 1:N
    key = words{i};
    hCode = hashstring(key, n);
    hCodes(key) = hCode; % a)
    count(hCode) = count(hCode) + 1; % b)
end
collisions = sum(sum(count) - 1); % c)
time = toc; % d)

hCodes_Chashstring = hCodes;
count_Chashstring = count;
collisions_Chashstring = collisions;
time_Chashstring = time;
