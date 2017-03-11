% Inlining
function Example6
n  = 1e7;
x  = 0;
dx = 1 / n;

% (1) Inlined version
tic
s = 0;
for k = 1:n
    s = s + sin(x) * exp(x) * atan(x);
    x = x + dx;
end
toc

x = 0;
% (2) Use a separate function
tic
s = 0;
for k = 1:n
    s = s + f(x);
    x = x + dx;
end
toc

end

function y = f(x)
y = sin(x) * exp(x) * atan(x);
end