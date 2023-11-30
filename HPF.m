clc;
clear;
close all;
fs = 10000;
ts = 1/fs;
fc = 1000;
n = 10;
w = fc/(fs/2);

b = fir1(n, w, 'high');

[h1,w1] = freqz(b,1);
subplot(3,1,1);
plot(w1,abs(h1));
title('Highpass FIR Filter Frequency Response');

f1=100; %Given
f2=4900; %Given

k = 1:500;
x = sin(2*pi*f1*k*ts) + sin(2*pi*f2*k*ts);
subplot(3,1,2);
plot(x);
title('Input Signal');

y = filter(b,1,x);
subplot(3,1,3);
plot(y);
title('Output Signal');