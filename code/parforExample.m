nruns = 20;
n = 1000;

% Run in serial
tic
a = zeros(n);
for i = 1:nruns
    a(i) = max(abs(eig(rand(n))));
end
toc

% Run parallel
%parpool(2);
tic
a = zeros(n);
parfor i = 1:nruns
    a(i) = max(abs(eig(rand(n))));
end
toc
