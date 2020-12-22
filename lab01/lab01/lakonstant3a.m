% Lab 01
% Exercise 3
% Part a
% By Lazaros Konstantinos-Panagiotis
% Serial number: 01639

clear all;

fs = 16;
Ts = 1/fs;
tmin = 0;
tmax = 10;
t = tmin:Ts:tmax;

f = 1;
A = 1;
phi = 0;

x = A * cos(2 * pi * f * t + phi);

figure;
plot(t,x,'bo-');
xlabel('Time t');
ylabel('Amplitude A');
title('Sinusoid');
grid on;

% Question a
% Observations:
% If the sampling frequency is lower smaller than 2 then the output we get is completely different from the cosine function.
% By changing the amplitude we can make the graph taller or shorter.
% By changing the phase of the sinusoid function we can cause horizontal shift for the sinusoid function.