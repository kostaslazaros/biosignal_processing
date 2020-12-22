% Lab 02
% Exercise 3
% Plot for pulse2 function
% Lazaros Konstantinos-Panagiotis
% 01639

t = [-10:10];

figure;

subplot(3, 1, 1);
x = pulse2(t, 1, 2);
plot(t, x, 'o');
title('Pulse2 01');
grid on;

subplot(3, 1, 2);
x = pulse2(t, 2, 2);
plot(t, x, 'o');
title('Pulse2 02');
grid on;