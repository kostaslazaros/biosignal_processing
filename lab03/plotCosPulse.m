% Lab03 
% Exercise 2 part b
% Lazaros Konstantinos-Panagiotis
% 01639

t = 0:0.1:10;
x = cosine(t, 1, 1, 0);
p1 = pulse(t, 5, 0);
p2 = pulse(t, 5, 2);
y1 = x .* p1;
y2 = x .* p2;

figure;
subplot(2, 1, 1);
plot(t, y1);
subplot(2, 1, 2);
plot(t, y2);