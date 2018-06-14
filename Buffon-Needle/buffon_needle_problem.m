% This program generates one set of estimates of pi corresponding to 
% 1000, 10000, 100000, 1000000 throws
L = 2; D = 5;
t = 1;
% No. of needle throws
for n = [1000:1000:1000000]
%for n = [1000,10000,100000,1000000]
    % Generate n random numbers for x within the range of 0 to D/2
    x = (D/2).*rand(n,1);
    % Generate n random numbers for theta within the range of 0 to pi
    theta = (pi).*rand(n,1);
    % Loop to count the number of line crossings
    crossings = 0;
    for k = 1:n
        if (L/2)*sin(theta(k)) >= x(k)
            crossings = crossings+1;
        end
    end

    p = crossings/n;
    pi_est(t) = (2*L)/(p*D);
    t = t+1;
end

pi_est
%n = [1000,10000,100000,1000000];
n = 1000:1000:1000000;
figure(1)
plot(n,pi_est,'o',[0 max(n)],[pi pi],'r'),xlabel('Number of throws, n'),ylabel('Estimate of pi'),title('Estimated value of pi vs. n')
grid on
%figure(2)
%bar(log10(n),(pi_est-pi)/pi),ylabel('(estimated pi - pi)/pi'),xlabel('Log10(number of throws), n'),title('Error in the estimated values of pi vs. n')