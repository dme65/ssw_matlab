% Don't trust JIT!
n = 1000000;
a = randn(1, n);

% 1
tic
s1 = 0;
for k = 1:n
    s1 = s1 + a(k);
end
toc

% 2
tic
s2 = 0;
k  = 1;
while k <= n
    s2 = s2 + a(k);
    k  = k + 1;
end
toc

% 3
tic
s3 = 0;
for k = a
    s3 = s3 + k;
end
toc

% 4
tic
s4 = sum(a);
toc