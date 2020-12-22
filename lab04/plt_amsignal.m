% lab exercrise set 04
% plotting am signal function
% Lazaros Konstantinos-Panagiotis
% 01639

fs = 440;
Ts = 1 / fs;
t = 0:Ts:1;

x = am_signal(220, 12, 1, t);
figure;
plot(t, x);
title('AM signal function');