clc;
clear;
close all;
Rp = 1;
Rs = 50;
Wp = [0.2 0.7];
Ws = [0.1 0.8];
[n,Wn] = cheb1ord(Wp,Ws,Rp,Rs);
[b,a] = cheby1(n,Rp,Wn,'bandpass');
[h,w] = freqz(b,a,512);
plot(w,abs(h));
title("Band Pass Chebyshev Filter");