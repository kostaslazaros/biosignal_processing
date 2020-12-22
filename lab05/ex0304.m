% Lab 05
% Exercise 03 and 04
% Lazaros Konstantinos-Panagiotis
% 01639
% plot sinc_fun
% spectrum changes if we change fs
% the result is the same whether we use the sinc or the pulse function.

fs = 1000;
Ts = 1/fs;
tmin = 0;
tmax = 1;
t = tmin:Ts:tmax;
f1 = 10;
f2 = 20;
f3 = 30;
A = 10;
phi = 0;

x1 = A * cos(2 * pi * f1 * t + phi);
x2 = A * cos(2 * pi * f2 * t + phi);
x3 = A * cos(2 * pi * f3 * t + phi);
x = x1 + x2 + x3;

N = length(x);
n = 1:N;

figure;
subplot(3,1,1);
plot(t,x);
title('Original signal');

subplot(3,1,2);
plot(n, x);
title('Discrete signal');
axis([0 1000 -5*A 5*A]);

reconstructed = [];

for n=1:N
  %reconstructed(n) = sum(x(n) .* sinc(t(n) - n*Ts));
  reconstructed(n) = sum(x(n) .* rectpuls(t(n) - n * Ts));
end

subplot(3,1,3);
plot(t, reconstructed);
title('Reconstructed signal');

figure;
[f,a,p] = fftfun(reconstructed, fs);
subplot(2,1,2);
plot(f,a);
axis([-100 100 0  6000]);
title('Spectrum of the reconstructed signal');
































