clc;
clear;
close all;
x = zeros(1,100);
for n = 1:100
    x(n) = n;
end
N = 100;
X = zeros(1,N);
for k = 1:N
    for j = 1:N
        X(k) = X(k) + x(j)*exp(-1i*2*pi*(j-1)*(k-1)/N);
    end
end

subplot(2,1,1);
stem(abs(X));
title('DFT using custom function');

y = fft(x);
subplot(2,1,2);
stem(abs(y));
title('DFT using inbuilt funSction');