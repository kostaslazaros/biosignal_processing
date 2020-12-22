% Lab03 
% Exercise 3 part b cosine with white noise
% Lazaros Konstantinos-Panagiotis
% 01639

fs = 64;
Ts = 1 / fs;
t0 = 0;
t1 = 10;
t = t0:Ts:t1;
x = noiseFun(1, t);
y = cosine(t, 1, 1, 0);
z = x + y;
figure;
subplot(3, 1, 1);
plot(t, x);
title('White noise');
subplot(3, 1, 2);
plot(t, y);
title('Cosine function');
subplot(3, 1, 3);
plot(t, z);
title('Cosine with white noise');