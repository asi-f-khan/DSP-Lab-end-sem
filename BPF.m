clc;
clear;
fs = 10000;
ts = 1/fs;
n = 10;
w = [1000/(10000/2), 2000/(10000/2)];

b = fir1(n, w, 'bandpass');

[h1,w1] = freqz(b,w);
subplot(3,1,1);
plot(w1,abs(h1));
title('Bandpass FIR Filter Frequency Response');

k = 1:500;
x = sin(2*pi*1500*k*ts) + sin(2*pi*100*k*ts);
subplot(3,1,2);
plot(x);
title('Input Signal');

y = filter(b,1,x);
subplot(3,1,3);
plot(y);
title('Output Signal');