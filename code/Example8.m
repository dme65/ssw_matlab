% More rows or more columns?
m = 2;
n = 100000;
A = sprandn(m, n, 0.001);
x = randn(n, 1);
y = zeros(m, 1);

% (1) More rows than columns
tic
for k = 1:1000
    y = y + A * x;
end
toc

y = zeros(m, 1);

% (2) More columns than rows
tic
At=A';
for k=1:1000
    y = y + (x'*At)';
end
toc