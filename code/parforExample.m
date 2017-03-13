% Run in serial
tic
n = 20;
A = 500;
a = zeros(n);
for i = 1:n
    a(i) = max(abs(eig(rand(A))));
end
toc

% Run in parallel
delete(gcp('nocreate')); % Just in case there already exists a parallel pool
parpool(2);
tic
n = 20;
A = 500;
a = zeros(n);
parfor i = 1:n
    a(i) = max(abs(eig(rand(A))));
end
toc
delete(gcp('nocreate'));