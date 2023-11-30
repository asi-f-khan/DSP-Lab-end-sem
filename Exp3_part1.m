clc
clear;
close all;

% for  filtering noise
f1 = 100;
f2 = 200;
f3 = 2000;
freq = [f1 f2 f3];
fs = 4 * max(freq);
ts = 1 / fs;
s = [];
x = [];

for n = 1:1:100
    s = [s ,50 * sin(2*pi*f1*n*ts) + 40 * sin(2*pi*f2*n*ts)]; %s me concatenate krte chala jayea aur vector bn jayega
    x = [x ,50 * sin(2*pi*f2*n*ts) + 40 * sin(2*pi*f2*n*ts) + 15 * sin(2*pi*f3*n*ts)];
end

wc = (2*pi*100*ts);
m = 51; % Choose an appropriate filter order (odd number)
hd = zeros(1, m);

for i = 1:m
    if i == (m+1)/2
        hd(i) = wc/pi;
    else
        hd(i) = (wc/pi) * sin(wc*((i-1)-(m-1)/2))/((i-1)-(m-1)/2);
    end
end

h1 = ham(hd);
[y1] = conv(x, h1);
h2 = hann(hd);
[y2] = conv(x, h2);
h3 = bart(hd);
[y3] = conv(x, h3);
h4 = black(hd);
[y4] = conv(x, h4);
h5 = rect(hd);
[y5] = conv(x, h5);

subplot(3,3,1); plot(abs(fft(s))); title('s fft'); %abs isliye kyunki imaginary bhi ho skta hai
subplot(3,3,2); plot(abs(fft(x))); title('x fft');
subplot(3,3,3); plot(abs(fft(y1))); title('hamming fft');
subplot(3,3,4); plot(abs(fft(y2))); title('hanning fft');
subplot(3,3,5); plot(abs(fft(y3))); title('bartlett fft');
subplot(3,3,6); plot(abs(fft(y4))); title('blackmann fft');
subplot(3,3,7); plot(abs(fft(y5))); title('rectangular fft');
subplot(3,3,8); plot(abs(s)); title('s in time domain');
subplot(3,3,9); plot(abs(x)); title('x in time domain');

% HAMMING
function h = ham(hd)
m = length(hd);
w = 0.54 + 0.46 * cos(2 * pi * (0:m-1) / (m-1));
h = hd .* w;
end

% HANNING
function h = hann(hd)
m = length(hd);
w = 0.5 + 0.5 * cos(2 * pi * (0:m-1) / (m-1));
h = hd .* w;
end

% RECTANGULAR
function h = rect(hd)
m = length(hd);
w = ones(1, m);
h = hd .* w;
end

% BLACKMANN
function h = black(hd)
m = length(hd);
w = 0.42 + 0.5 * cos(2 * pi * (0:m-1) / (m-1)) + 0.8 * cos(4 * pi * (0:m-1) / (m-1));
h = hd .* w;
end

% BARTLETT
function h = bart(hd)
m = length(hd);
w = 1 - (abs(2 * (0:m-1) - (m-1)) / (m-1));
h = hd .* w;
end
