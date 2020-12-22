% Lab 05
% Exercise 01
% Lazaros Konstantinos-Panagiotis
% 01639
% part a-d

fs = 1000;
Ts = 1 / fs;
tmin = 0;
tmax = 0.05;
t = tmin:Ts:tmax;
f1 = 100;
f2 = 200;
f3 = 300;
A = 10;
phi = 0;

x1 = A * cos(2 * pi * f1 * t + phi);
x2 = A * cos(2 * pi * f2 * t + phi);
x3 = A * cos(2 * pi * f3 * t + phi);
x = x1 + x2 + x3;
y = fft(x);


% This is the homemade fft_fun
[frequency, magnitude, phase] = fftfun(x, fs);

x4 = ifft(y);

figure; 
plot(t,x); 
title('Original signal');

figure;
plot(abs(y));
title('FFT Magnitude');

figure;
plot(angle(y));
title('FFT Phase');

figure;
subplot(2,1,1);
plot(frequency, magnitude);
xlabel('Frequency(Hz)');
ylabel('Magnitude');
subplot(2,1,2);
plot(frequency, phase);
xlabel('Frequency(Hz)');
ylabel('Phase');

figure
plot(t, real(x4));
title('Reconstructed signal');


% Signal shifting here
y_shifted = fftshift(y);
N = length(y);
freq = -fs/2:fs/N:(fs/2-fs/N);

% Cut off frequencies here
index_to_cut = round(f3 * N / fs);
y(index_to_cut + 1) = 0;
y(N - index_to_cut + 1) = 0;

% ifft after cutting off frequency

x5 = ifft(y);

figure;
plot(t, x5);
title('Reconstructed after frequency cut offs');


















