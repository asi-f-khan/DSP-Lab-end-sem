clc
clear all
close all
f1=200;
f2=250;
fs=800;
n=0:199;
ts=1/fs;
a=sin(2*pi*f1*n*ts);
b=cos(2*pi*f2*n*ts);

subplot(4,1,1);
plot(n,a);
xlabel('Time');
ylabel('Amplitude');
title('Sine Graph');
subplot(4,1,2);
plot(n,b);
xlabel('Time');
ylabel('Amplitude');
title('Conine Graph');


subplot(4,1,3);
z1=conv(b,a);
plot(z1);
xlabel('Time');
ylabel('Amplitude');
title('Covolution of a and b  Graph');

subplot(4,1,4);
z2=cconv(b,a);
plot(z2);
xlabel('Time');
ylabel('Amplitude');
title(' Cross Covolution of a and b  Graph');