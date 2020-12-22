% Lab 05
% Exercise 02
% Lazaros Konstantinos-Panagiotis
% 01639
% plot sinc_fun

fs = 1000;
Ts = 1/fs;
tmin = -20;
tmax = 20;
t = tmin:Ts:tmax;

x = sinc_fun(t);

figure;
plot(t, x);
title('Sinc function (homemade)');