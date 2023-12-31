clc;
clear;
close all;
x = zeros(1,64);  %N=64  .. N should be power of two to calculate FFT
for n = 1:64
    x(n) = n;
end
X_dit = fft_dit(x);
X_dif = fft_dif(x);

subplot(3,1,1);
stem(abs(fft(x)));
xlabel('Frequency Bin');
ylabel('Magnitude');
title('FFT using Inbuilt Function');

subplot(3,1,2);
stem(abs(X_dit));
xlabel('Frequency Bin');
ylabel('Magnitude');
title('FFT using User-defined DIT Function');

subplot(3,1,3);
stem(abs(X_dif));
xlabel('Frequency Bin');
ylabel('Magnitude');
title('FFT using User-defined DIF Function');

function X = fft_dit(x)
    N = length(x);
    
    if N == 1
        X = x;
    else
        x_even = x(1:2:N);
        x_odd = x(2:2:N);
        
        X_even = fft_dit(x_even);
        X_odd = fft_dit(x_odd);
        
        factor = exp(-2i * pi / N);
        W = 1;
        
        for k = 1:N/2
            t = W * X_odd(k);
            X(k) = X_even(k) + t;
            X(k + N/2) = X_even(k) - t;
            W = W * factor;
        end
    end
end

function X = fft_dif(x)
    N = length(x);

    if N <= 1
        X = x;
    else
        even = fft_dif(x(1:2:N-1));
        odd = fft_dif(x(2:2:N));

        factor = exp(-2i * pi / N);
        twiddle = factor.^(0:N/2-1);

        X = [even + twiddle .* odd, even - twiddle .* odd];
    end
end
