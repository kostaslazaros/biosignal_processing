% Lab03 
% Exercise 2 part a
% Lazaros Konstantinos-Panagiotis
% 01639

t = 0:0.1:10;

u1 = unitStep(t, 0);
u2 = unitStep(t, 2);
x = cosine(t, 1, 1, 0);

y1 = x .* u1;
y2 = x .* u2;

figure;
subplot(2, 1, 1);
plot(t, y1);
subplot(2, 1, 2);
plot(t, y2);