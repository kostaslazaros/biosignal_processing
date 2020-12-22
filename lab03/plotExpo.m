% Lab03 
% Exercise 1 part b
% Lazaros Konstantinos-Panagiotis
% 01639


t = 0:0.1:10;
x = exponential(e, t, 0);
y = exponential(e, t, 2);

figure;
subplot(2, 1, 1);
plot(t, x, 'o');
subplot(2, 1, 2);
plot(t, y, 'o');