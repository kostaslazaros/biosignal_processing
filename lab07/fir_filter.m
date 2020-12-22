% fir filter designed with the same parameters as the lab example
% Lazaros Konstantinos-Panagiotis
% 01639
% Also includes plot of the low pass fir filter



f=[0 0.6 0.6 1];
m = [1 1 0 0];

h = fir2(30, f, m);
[H, w] = freqz(h, 1, 128);

plot(f, m, 'b');
hold on;
plot(w / pi, abs(H), 'r');
title('Ideal fir designed');

