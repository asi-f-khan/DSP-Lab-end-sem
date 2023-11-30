% Overlap Add method for Linear Convolution
close all;
clear;
clc;
x=[3,-1,0,1,3,2,0,1,2,1];    %Given
h=[1,1,1];     %Given

N1=length(x);
M=length(h);
L= (2^M)- M +1;          % N= 2^M and L= N-M+1 

%By Inbuilt function
lc=conv(x,h);            %inbuilt func to caclculate linear convolution

%By overlap and add method
x=[x zeros(1,mod(-N1,L))];
N2=length(x);
h=[h zeros(1,L-1)];
H=fft(h,L+M-1);
S=N2/L;
index=1:L;
X=[zeros(M-1)];
for stage=1:S
    xm=[x(index) zeros(1,M-1)];        % Selecting sequence to process
    X1=fft(xm,L+M-1);
    Y=X1.*H;
    Y=ifft(Y);
    Z=X((length(X)-M+2):length(X))+Y(1:M-1);    %Samples Added in every stage
    X=[X(1:(stage-1)*L) Z Y(M:M+L-1)];
    index=stage*L+1:(stage+1)*L;
end
i=1:N1+M-1;
X=X(i);

subplot(2,1,1);
stem(lc);
title('Convolution Using conv() function');
xlabel('n');
ylabel('y(n)');

subplot(2,1,2);
stem(X);
title('Convolution Using Overlap Add Method');
xlabel('n');
ylabel('y(n)');