% Lab 01
% Exercise 3
% Part b
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

x = sinusoidFun(t, A, f, phi);

figure;
plot(t,x,'bo-');
xlabel('Time t');
ylabel('Amplitude A');
title('Sinusoid');
grid on;