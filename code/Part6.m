% Matrix multiplication
A = randn(1000);

% 1
tic
for k = 1:100
    C = A' * A;
end
toc

% 2
tic
for k = 1:100
    C = A * A';
end
toc

% 3
tic
for k = 1:100
    C = A * A;
end
toc

%%%%%%%%%%%%%%%

A = rand(1000);
B = rand(1000);

% 4
tic
for k = 1:100
    C = A * B;
end
toc

A = single(A);
B = single(B);

% 5
tic
for k = 1:100
    C = A * B;
end
toc