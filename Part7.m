% Inlining
function inline_ex
n  = 1e7;
x  = 0;
dx = 1 / n;

% 1
tic
s = 0;
for k = 1:n
    s = s + sin(x) * exp(x) * atan(x);
    x = x + dx;
end
toc
s

x = 0;
% 2
tic
s = 0;
for k = 1:n
    s = s + f(x);
    x = x + dx;
end
toc
s
end

function y = f(x)
y = sin(x) * exp(x) * atan(x);
end