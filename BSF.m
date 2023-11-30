clc;
clear;
close all;
fs = 10000;
ts = 1/fs;
n = 10;
w = [1000/(10000/2), 2000/(10000/2)];

b = fir1(n, w, 'stop');

[h1,w1] = freqz(b,w);
subplot(3,1,1);
plot(w1,abs(h1));
title('Bandstop FIR Filter Frequency Response');

f1=100; %Given
f2=1500; %Given

k = 1:500;
x = sin(2*pi*f1*k*ts)+ sin(2*pi*f2*k*ts) ;
subplot(3,1,2);
plot(x);
title('Input Signal');

y = filter(b,1,x);
subplot(3,1,3);
plot(y);
title('Output Signal');