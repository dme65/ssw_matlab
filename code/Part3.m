% Using ()
n = 1000;
v = randn(n, 1);
a = randn(n, 1);
loops = 100;

% 1
tic
for j = 1:loops
    A = v * v';
    y = A * a;
end
toc

% 2
tic
for j = 1:loops
    y = v * v' * a;
end
toc

% 3
tic
for j = 1:loops
    y = v * (v' * a);
end
toc