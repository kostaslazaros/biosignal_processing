% Lab 02
% Plotting for dirac and pulse functions
% Lazaros Konstantinos-Panagiotis
% 01639

% for dirac function
t = [-10:10];
figure;
subplot(3, 1, 1);
x = dirac(t, 0);
plot(t, x, 'o');
title('Dirac function 01');
grid on;

subplot(3, 1, 2);
x = dirac(t, 2);
plot(t, x, 'o');
title('Dirac function 02');
grid on;

% for pulse function
figure;

subplot(3, 1, 1);
x = pulse(t, 0, 2);
plot(t, x, 'o');
title('Pulse function 01');
grid on;

subplot(3, 1, 2);
x = pulse(t, 1, 2);
plot(t, x, 'o');
title('Pulse function 02');
grid on;









