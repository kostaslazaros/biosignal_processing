% Lab03 
% Exercise 2 part c
% Lazaros Konstantinos-Panagiotis
% 01639

t = 0:0.1:10;
x = cosine(t, 1, 1, 0);
z1 = exponential(e, t, 4);
z2 = exponential(e, t, 6);

y1 = x .* z1;
y2 = x .* z2;

figure;
subplot(2, 1, 1);
plot(t, y1 );
subplot(2, 1, 2);
plot(t, y2);