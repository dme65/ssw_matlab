% Using arrays for indexing
n = 100000;
a=full(sprand(n,1,0.001));
b = a;
c = a;
loops = 200;

a_save = a;

% 1
tic
for j = 1:loops
    for k = 1:length(a)
        if a_save(k) < 0
            a(k) = 0;
        end
    end
end
toc

% 2
tic
for j = 1:loops
    b(a_save < 0) = 0;
end
toc

% 3
tic;
for j = 1:loops
    indx = find(a_save < 0);
    c(indx) = 0;
end
toc