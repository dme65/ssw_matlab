% Block Investigation
numReps=20;
numIter=20;
n = 5000;
A = spdiags(randn(n,101),-50:50,n,n);
averageTime=zeros(1,numIter);
for bs=1:numIter
    x=randn(n,bs);
    tic;
    for k=1:numReps
        y=A*x;
    end
    averageTime(bs) = toc/numReps;
end
figure
subplot(2,1,1)
plot(averageTime/averageTime(1))
title('time(bs) / time(1)')
xlabel('bs')
ylabel('seconds')
subplot(2,1,2)
plot((averageTime./(1:numIter))/averageTime(1))
title('( time(bs) / bs ) / time(1)')
xlabel('bs')
ylabel('seconds')