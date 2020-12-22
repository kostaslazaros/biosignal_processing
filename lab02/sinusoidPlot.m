% Lab 02
% Plotting for dirac and pulse functions
% Lazaros Konstantinos-Panagiotis
% 01639

fs = 16;
Ts = 1/fs;
t0 = 0;
t1 = 10;
t = t0:Ts:t1;
x = sinusoid(t, 1, 1, 0);
y1 = sinusoid(2*t, 1, 1, 0);
y2 = sinusoid(t/2, 1, 1, 0);

figure;
subplot(311);
plot(t, x, 'o');
subplot(312);
plot(t, y1, 'o');
subplot(313);
plot(t, y2, 'o');

% I observe that there is a difference in frequencies from the sinusoid curve of each plot.
% The second plot does not look like a sinusoid curve. It seems that the frequency is altered in the second case
% Case number 1 (x) and case number 3 (y2) are totally fine. Their frequency has not been altered in a negative way