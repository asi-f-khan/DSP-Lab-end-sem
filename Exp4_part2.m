clc % Clear the command window
clear all;
close all;

polezero(-0.5-0.5i, 0+0i);
polezero(-1+1i, 0);
polezero(-1-1i, 0);
polezero(-0.5+0.5i, 0);
polezero(1i, 0.5+0.5i);

function polezero(z, p)
    w = 0:0.1:2*pi;
    n = length(w);
    j = sqrt(-1);
    a = exp(j * w);
    H = zeros(1, n);

    for i = 1:n
        H(i) = (a(i) - z) / (a(i) - p);
    end

    magnitude = abs(H);
    phase = angle(H);

    figure;
    subplot(2, 1, 1);
    plot(w, magnitude, 'k');
    ylabel('Magnitude');

    subplot(2, 1, 2);
    plot(w, phase, 'k');
    ylabel('Phase');
end
