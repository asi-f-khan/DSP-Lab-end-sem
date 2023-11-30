% Overlap Save method for Linear Convolution

close all;
clear;
clc;
x=[3,-1,0,1,3,2,0,1,2,1]; %Given
h=[1,1,1];       %Given

N1=length(x);
M=length(h);
L= (2^M)- M +1;         % N= 2^M and L= N-M+1 

%By Inbuilt function
lc=conv(x,h);       %inbuilt func to caclculate linear convolution

%By overlap and save method
x=[x zeros(1,mod(-N1,L)) zeros(1,L)];
N2=length(x);
h=[h zeros(1,L-1)];
H=fft(h,L+M-1);
S=N2/L;
index=1:L;
xm=x(index);        % For first stage Special Case 
x1=[zeros(1,M-1) xm];    %zeros appeded at Start point
X=[];
for stage=1:S
    X1=fft(x1,L+M-1);
    Y=X1.*H;
    Y=ifft(Y);
    index2=M:M+L-1;
    Y=Y(index2);        %Discarding Samples
    X=[X Y];
    index3=(((stage)*L)-M+2):((stage+1)*L);        % Selecting Sequence to process
    if(index3(L+M-1)<=N2)
    x1=x(index3);
    end
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
title('Convolution Using Overlap Save Method')
xlabel('n');
ylabel('y(n)');
