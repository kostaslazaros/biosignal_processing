% Lab 05
% Exercise 05
% Lazaros Konstantinos-Panagiotis
% 01639
% Whatever the result, this is actually wrong.
% Chirp is a function with variable frequency.
% Fourier transforms can only be performed when frequency is static.
fs = 1000;
Ts = 1 / fs;
t = 0:Ts:10;
x = chirp_manual(220, 2320, t, 3, 0);

[frequency, magnitude, phase] = fftfun(x, fs);

figure;
plot(frequency, magnitude);