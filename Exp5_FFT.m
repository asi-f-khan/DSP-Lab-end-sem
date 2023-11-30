x = [1, 2, 3, 4];
X_dit = fft_dit(x);
X_dif = fft_dif(x);

disp('DIT FFT:');
disp(X_dit);
imagesc(abs(X_dif));

disp('DIF FFT:');
disp(X_dif);


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
    
    if N == 1
        X = x;
    else
        x_even = x(1:N/2);
        x_odd = x(N/2+1:N);
        
        X_even = fft_dif(x_even);
        X_odd = fft_dif(x_odd);
        
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
