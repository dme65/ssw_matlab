% Dynamic memory allocation
n = 1000;
p = 2000;
x = randn(n, 1);

% Allocate and fill out columns
tic
X = zeros(n, p);
for k = 1:p
    X(:, k) = x;
end
toc

% Add columns
tic
X = [];
for k = 1:p
    X(:, k) = x;
end
toc

% Add rows
tic
X = [];
for k = 1:p
    X = [X; x'];
end
toc

% Combine and assign to X
tic
X = [];
for k = 1:p
    X = [X, x]; 
end
toc


% Avoid the for-loop
tic
X = repmat(x,[1 p]);
toc
