% Estimate Pi in Serial
function estimatePi()
feature accel on
tic;
count = 0;      % count variable, start value set to zero
n=1000000;
for i=1:n 
    x=rand;     
    y=rand;
    
    if (x^2+y^2 <=1)  %if pair is within the first quadrant of the unit circle
        count = count +1;   % if yes, it increases the count by one
    end
end
piapprox = 4*(count/n);
time = toc;
disp('Value of Pi is:');
disp(piapprox);

% Estimate Pi with Two Workers
parpool(2)
tic;
      % count variable, start value set to zero
n=1000000;
count = zeros(2,1);
parfor i=1:n 
    x=rand;
    y=rand;
    
    if (x^2+y^2 <=1)  %if pair is within the first quadrant of the unit circle
        idx = mod(i,2);
        count(idx) = count(idx) + 1;   % if yes, it increases the count by one
    end
end
piapprox = 4*(sum(count)/n);
toc;
disp('Value of Pi is:');
disp(piapprox);
delete(gcp('nocreate'));
