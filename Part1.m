% Dynamic memory allocation
n = 1000;
p = 2000;
x = randn(n, 1);

% 1
tic
X = zeros(n, p);
for k = 1:p
    X(:, k) = x;
end
toc

% 2
tic
X = [];
for k = 1:p
    X(:, k) = x;
end
toc

% 3
tic
X = [];
for k = 1:p
    X = [X, x];  % same speed as this one
end
toc

% --------------------------------

x = transpose(x);

% 4
tic
X = zeros(p, n);
for k = 1:p
    X(k, :) = x;
end
toc

% 5
tic
X = [];
for k = 1:p
    X(k, :) = x;
end
toc

% 6
tic
X = [];
for k = p:-1:1
    X(k, :) = x;
end
toc

%%%%%% Optimal %%%%%%
x=transpose(x);

% Method 1
tic
X=repmat(x,[1 p]);
toc

% Method 2
tic
X=x(:,ones(1,p));
toc