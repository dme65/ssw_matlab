% movingAvg() is a demo for SSW meant for a profiler tutorial
%
% Questions Before Demo:
% 1. Where are some obvious inefficiencies?
% 2. What do people think will be the most expensive operation in movingAvg()?
% 3. How do we make this faster?
function movingAvg()

% Generate Signal with noise
n = 100000;
x = linspace(1,10,n);
for i = 1:n
    y(i) = sin(0.01*x(i)) + 0.1*rand;
end

% Save y as data
save('y.mat','y');

% Low Pass Filter with a window size of 5
k = 5;
yFiltered = LPfilter(y,k);

% Save y as data
save('yFiltered.mat','yFiltered');

% Plot y and yFiltered and save
figure('Visible','off');
plot(x,y,'-b',x,yFiltered,'-r');
legend('Noisy','Signal');
saveas(gcf,'movingAvg.png');


end

% LPfilter(n) is a moving average, lowpass filter forcing each element to
% be an unweighted sum of its k neighbors
%
% INPUT:
% y = time-domain signal
% k = number of neighbors to average on each side
% OUTPUT:
% yFiltered = filtered signal

function yFiltered = LPfilter(y, k)
    
    % Pad y with zeros to make indexing easier
    n = length(y);
    z = zeros(1,k);
    y = [z, y, z];
    
    % Iterate through y and calculate moving average
    for i = 1:n
        idx = i+k;
        sum = 0;
        ytemp = y(idx-k:idx+k);
        for j = 1:2*k+1
            sum = sum + ytemp(j);
        end
        yFiltered(i) = sum/k;
    end
end