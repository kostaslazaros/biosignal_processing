% Lab02
% Exercise1 part b
% Lazaros Konstantinos-Panagiotis
% 01639


t = [-100:100];
figure;
subplot(3,1,1);
x = unitStepFun(t, 0);
plot(t, x, 'o');
title('Original');
grid on;
subplot(3, 1, 2);
x = unitStepFun(t, 20);
plot(t, x, 'o');
title('Shift right (delay)');
grid on;
subplot(3, 1, 3);
x = unitStepFun(t, -20);
plot(t, x, 'o');
title('Shift left (advance)');
grid on;







