% Dynamic memory allocation for sparse matrices
n = 30000;
m = 150;
tic

% 1
X = sparse(n, n);
for j = 1:m:n
     for k = 1:m:n
          X(j, k) = 1;
     end
end
toc

% Suppose we know the sparsity structure
[rows, cols] = find(X);

% 2
tic
Y = sparse(rows, cols, ones(size(rows)));
for j = 1:m:n
     for k = 1:m:n
          Y(j, k) = 1;  % but not the elements
     end
end
toc

% 3
tic
Z = sparse(rows, cols, ones(size(rows)));
toc
