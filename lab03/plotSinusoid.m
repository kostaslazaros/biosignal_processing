% Lab03 
% Exercise 1 part c
% Lazaros Konstantinos-Panagiotis
% 01639

t = 0:0.1:10;
x1 = sinusoid(t, 0, 1, 1, 0);
x2 = sinusoid(t, 0.3, 1, 1, pi);

figure;
subplot(2, 1, 1);
plot(t, x1);
subplot(2, 1, 2);
plot(t, x2);
