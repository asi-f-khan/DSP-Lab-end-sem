
a1=4.0; a2=5.0; a3=6.0; a4=7.0;
f1=200; f2=300; f3=400; f4=500;
fs=8000;
t0 = linspace(0, 0.1, fs);

y1 = sin(2 * pi * f1 * t0);
y2 = sin(2 * pi * f2 * t0);
y3 = sin(2 * pi * f3 * t0);
y4 = sin(2 * pi * f4 * t0);

x = a1*y1 + a2*y2 + a3*y3 + a4*y4;

N = length(y1);
t1 = -(N-1): N-1;

z1 = cr_corr(x, y1);
subplot(4,1,1);
plot(t1, z1);
xlabel('Time');
ylabel('Cross-Correlation');
title('Cross-Correlation between x and y1');

z2 = cr_corr(x, y2);
subplot(4,1,2);
plot(t1, z2);
xlabel('Time');
ylabel('Cross-Correlation');
title('Cross-Correlation between x and y2');

z3 = cr_corr(x, y3);
subplot(4,1,3);
plot(t1, z3);
xlabel('Time');
ylabel('Cross-Correlation');
title('Cross-Correlation between x and y3');

z4 = cr_corr(x, y3);
subplot(4,1,4);
plot(t1, z4);
xlabel('Time');
ylabel('Cross-Correlation');
title('Cross-Correlation between x and y4');

function cross_corr = cr_corr(signal1, signal2)
    % Length of the signals
    N = length(signal1);
    % Initialize the cross-correlation result
    cross_corr = zeros(1, 2*N - 1);
    % Compute cross-correlation using sliding window
    for delay = -N+1:N-1
        if delay < 0
            signal1_shifted = signal1(1:end+delay);
            signal2_shifted = signal2(1-delay:end);
        else
            signal1_shifted = signal1(1+delay:end);
            signal2_shifted = signal2(1:end-delay);
        end
        cross_corr(delay + N) = sum(signal1_shifted .* signal2_shifted);
    end
end