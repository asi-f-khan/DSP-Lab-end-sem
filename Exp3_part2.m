%Ye bahot easy h -> bs sbke window function likho use baad uska freqz() and
%angle(freqz()) plot kr do

clc;
clear;
close all;
N = 31;
n = -15:1:15;

% Ye sara function DSP me pdhe hain waha se dekh lo revise krne ke liye
A = ones(1, N); % Rectangular window
D = 1 - (2 * (abs(n) / 30));  %Barlett
E = 0.42 + 0.5 * cos((2 * pi * n) / 30) + 0.08 * cos((4 * pi * n) / 30);
T = 0.54 + 0.46 * cos((2 * pi * n) / 30);

W = 0.5 * (1 + cos(2 * pi * n / 30));

%figure(1) %sare figure ko comment kr diya kyuki mujhe sb ek hi me chahiye
subplot(10, 1, 1)
plot(abs(freqz(D)));
title('bartlett');
ylabel('magnitude(db)');
subplot(10, 1, 2)
plot(angle(freqz(D)))
ylabel('phase(rad)')
xlabel('frequency(hz)')

%figure(2)
subplot(10, 1, 3)
plot(abs(freqz(E)));
title('blackman');
ylabel('magnitude(db)');
subplot(10, 1, 4)
plot(angle(freqz(E)))
ylabel('phase(rad)')
xlabel('frequency(hz)')

%figure(3)
subplot(10, 1, 5)
plot(abs(freqz(T)));
title('hamming');
ylabel('magnitude(db)');
subplot(10, 1, 6)
plot(angle(freqz(T)))
ylabel('phase(rad)')
xlabel('frequency(hz)')

%figure(4)
subplot(10, 1, 7)
plot(abs(freqz(W)));
title('hanning');
ylabel('magnitude(db)');
subplot(10, 1, 8)
plot(angle(freqz(W)))
ylabel('phase(rad)')
xlabel('frequency(hz)')

%figure(5)

subplot(10, 1, 9)
plot(abs(freqz(A)));
title('RECTANGULAR');
subplot(10, 1, 10)
plot(angle(freqz(A)))
ylabel('phase(rad)')
xlabel('frequency(hz)')
