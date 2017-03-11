% Matrix multiplication
A = randn(5000);

% 1
tic
C = A' * A;
toc

% 2
tic
C = A * A';
toc

% 3
tic
C = A * A;
toc