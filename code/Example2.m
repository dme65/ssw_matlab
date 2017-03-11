% Dynamic memory allocation for sparse matrices
n = 30000;
m = 150;
tic

% (1) Insert one element at a time in the sparse data structure
X = sparse(n, n);
for j = 1:m:n
     for k = 1:m:n
          X(j, k) = 1;
     end
end
toc

% (2) Suppose we know the sparsity structure, but not the elements
[rows, cols] = find(X);
tic
Y = sparse(rows, cols, ones(size(rows)));
for j = 1:m:n
     for k = 1:m:n
          Y(j, k) = 1;
     end
end
toc

% (3) Insert elements + values at the same time
tic
Z = sparse(rows, cols, ones(size(rows)));
toc