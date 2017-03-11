% Using ()
n = 1000;
v = randn(n, 1);
a = randn(n, 1);
loops = 100;

% (1) Form A and then compute matrix times vector
tic
for j = 1:loops
    A = v * v';
    y = A * a;
end
toc

% (2) Avoid forming A
tic
for j = 1:loops
    y = v * v' * a;
end
toc

% (3) Add parens to avoid matrix time vector
tic
for j = 1:loops
    y = v * (v' * a);
end
toc