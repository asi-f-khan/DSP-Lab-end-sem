%STUDY OF FILTERING USING IIR FILTER
clc
clear all;
close all;

Ts=1/4000;
n=1:1000;
z=1:1999;
zs=z*ts;
x1=100*sin(2*pi*20*n*Ts);
x2=200*sin(2*pi*30*n*Ts);
x3=50*sin(2*pi*500*n*Ts);
x=x1+x2+x3;
s=x1+x2;
figure('Name','IIR');
subplot(4,1,1);
plot(x);
ylabel('x[n]');
subplot(4,1,2);
plot(s);
ylabel('s[n]');
fs=30;
fc=10;
h1=bilinear1(fc,fs,x);
h2=implinvar(fc,fs,x);
y1=conv(x,h1);
y2=conv(x,h2);
subplot(4,1,3);
plot(y1);
ylabel('Bilinear y[n]');
subplot(4,1,4);
plot(y2);
ylabel('Imp Invar y[n]');
H1=fft(h1);
figure('Name','Bilinear Filter');
subplot(2,1,1);
plot(abs(H1));
ylabel('| H[k] |');
subplot(2,1,2);
plot(angle(H1));
ylabel('angle H[k]');
H2=fft(h2);
figure('Name','Impulse Invariant Filter');
subplot(2,1,1);
plot(abs(H2));
ylabel('| H[k] |');
subplot(2,1,2);
plot(angle(H2));
ylabel('angle H[k]');
X=fft(x);
Y1=fft(y1);
figure('Name','Bilinear Filter');
subplot(4,1,1);
plot(abs(X));
ylabel('| X[k] |');
subplot(4,1,2);
plot(angle(X));
ylabel('angle X[k]');
subplot(4,1,3);
plot(abs(Y1));
ylabel('| Y[k] |');
subplot(4,1,4);
plot(angle(Y1));
ylabel('angle Y[k]');
Y2=fft(y2);
figure('Name','Impulse Invariant Filter');
subplot(4,1,1);
plot(abs(X));
ylabel('| X[k] |');
subplot(4,1,2);
plot(angle(X));
ylabel('angle X[k]');
subplot(4,1,3);
plot(abs(Y2));
ylabel('| Y[k] |');
subplot(4,1,4);
plot(angle(Y2));
ylabel('angle Y[k]');


%filter by bilinier method
function [y]=bilinear1(fc,fs,x)
c=2*tan(pi*fc/fs);
a0=c^2/(4+2*sqrt(2)*c+c^2);
a1=2*a0;
b0=(4+c^2-2*sqrt(2)*c)/(4+2*sqrt(2)*c+c^2);
b1=(2*c^2-8)/(4+2*sqrt(2)*c+c^2);
y(1)=a0*x(1);
y(2)=a0*x(2)+a1*x(1)-b1*y(1);
for i=3:length(x)
y(i)=a0*x(i-2)+a1*x(i-1)+a0*x(i)-b0*y(i-2)-b1*y(i-1);
end
end
%filter by impulse invariant method
function y=implinvar(fc,fs,x)
c=2*pi*fc/fs;
y=zeros(1,length(x));
a=c*(-1+j)/(sqrt(2));
a0=exp(a)+exp(conj(a));
a1=exp(-sqrt(2)*c);
b0=c*(exp(a)-exp(conj(a)))/(sqrt(2)*j);
y(1)=0;
y(2)=b0*x(1);
for i=3:length(x)
y(i)=a0*y(i-1)-a1*y(i-2)+b0*x(i-1);
end
end

