clc;
clear;
close all;

a1=4.0; a2=5.0; a3=6.0; a4=7.0;
f1=200; f2=300; f3=400; f4=500;
fs=8000;
n=linspace(0,.1,fs);

y1 = sin(2 * pi * f1 * n);
y2 = sin(2 * pi * f2 * n);
y3 = sin(2 * pi * f3 * n);
y4 = sin(2 * pi * f4 * n);

x = a1*y1 + a2*y2 + a3*y3 + a4*y4;

z1 = asif_xcorr(x, y1);
subplot(4,1,1);
plot( z1);
xlabel('Time');
ylabel('Cross-Correlation');
title('Cross-Correlation between x and y1');

z2 = asif_xcorr(x, y2);
subplot(4,1,2);
plot( z2);
xlabel('Time');
ylabel('Cross-Correlation');
title('Cross-Correlation between x and y2');

z3 = asif_xcorr(x, y3);
subplot(4,1,3);
plot(z3);
xlabel('Time');
ylabel('Cross-Correlation');
title('Cross-Correlation between x and y3');

z4 = asif_xcorr(x, y3);
subplot(4,1,4);
plot(z4);
xlabel('Time');
ylabel('Cross-Correlation');
title('Cross-Correlation between x and y4');

function asif=asif_xcorr(signal1,signal2)

N= length(signal1);

asif=zeros(1,2*N-1);

for delay=-N+1:N-1
        if delay < 0
            signal1_shifted = signal1(1:end+delay);
            signal2_shifted = signal2(1-delay:end);
        else
            signal1_shifted = signal1(1+delay:end);
            signal2_shifted = signal2(1:end-delay);
        end
    asif(delay+N) = sum(signal1_shifted.*signal2_shifted);
end 
end
