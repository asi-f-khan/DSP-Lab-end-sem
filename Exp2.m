clc;
clear;
close all;
f1=200; f2=225;
fs=850;
n=0:199;
ts=1/fs;

a=sin(2*pi*f1*n*ts);
b=cos(2*pi*f2*n*ts);

subplot(4,2,1);
plot(n,a);
title('Sin');
xlabel('Time');
ylabel('Value');

subplot(4,2,2);
plot(n,b);
title('Cos');
xlabel('Time');
ylabel('Value');

x=conv (a,b);
subplot(4,2,3);
plot(x);
title('Convolution using Inbuilt Function');
xlabel('Time');
ylabel('Value');

y=cconv(a,b, length(n));
subplot(4,2,4);
plot(y);
title('Circular Convolution using Inbuilt Function');
xlabel('Time');
ylabel('Value');

conv_result = customConv(a, b);
subplot(4,2,5);
plot(conv_result);
title('Convolution using Defined Function');
xlabel('Time');
ylabel('Value');

conv_result_circular = circularConv(a, b);
subplot(4, 2, 6);
plot(conv_result_circular);
title('Circular Convolution using Defined Function');
xlabel('Time');
ylabel('Value');

diff_conv = x-conv_result;
subplot(4,2,7);
plot(diff_conv);
title('Difference (Convolution)');
xlabel('Time');
ylabel('Value');

diff_cconv = y-conv_result_circular;
subplot(4,2,8);
plot(diff_cconv);
title('Difference (Convolution)');
xlabel('Time');
ylabel('Value');

function conv_result = customConv(signal1, signal2)
    len1 = length(signal1);
    len2 = length(signal2);

    conv_result = zeros(1, len1 + len2 - 1);

    for i = 1:length(conv_result)
        for j = 1:len1
            if i - j + 1 > 0 && i - j + 1 <= len2
                conv_result(i) = conv_result(i) + signal1(j) * signal2(i - j + 1);
            end
        end
    end
end

function conv_result_circular = circularConv(signal1, signal2)
    len1 = length(signal1);

    conv_result_circular = zeros(1, len1);

    for i = 1:len1
        for j = 1:len1
            index = mod(i - j, len1) + 1;
            conv_result_circular(i) = conv_result_circular(i) + signal1(j) * signal2(index);
        end
    end
end