clc;
clear;
close all;
Rp = 1;
Rs = 50;
Wp = 0.4;
Ws = 0.6;
[n,Wn] = cheb1ord(Wp,Ws,Rp,Rs);
[b,a] = cheby1(n,Rp,Wn,'low');
[h,w] = freqz(b,a,512);
plot(w,abs(h));
title("Low Pass Chebyshev Filter");