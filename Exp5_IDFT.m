clc;
clear;
close all;

X1 = [1,1+1i,2,1-1i];
N1 = 4;

x1 = zeros(1,N1);

for k = 1:N1
    for j = 1:N1
        x1(k) = x1(k) + X1(j)*exp(1i*2*pi*(j-1)*(k-1)/N1);
    end
    x1(k) = x1(k)/N1;
end

X2 = [1,1+1i,2+1i,2-1i,1-1i];
N2 = 5;
x2 = zeros(1,N2);
for k = 1:N2
    for j = 1:N2
        x2(k) = x2(k) + X2(j)*exp(1i*2*pi*(j-1)*(k-1)/N2);
    end
    x2(k) = x2(k)/N2;
end

subplot(2,2,1);
stem(abs(x1));
title('IDFT of X1 using custom function');

y1 = ifft(X1);
subplot(2,2,2);
stem(abs(y1));
title('IDFT of X1 using inbuilt function');

subplot(2,2,3);
stem(abs(x2));
title('IDFT of X2 using custom function');

y2 = ifft(X2);
subplot(2,2,4);
stem(abs(y2));
title('IDFT of X2 using inbuilt function');