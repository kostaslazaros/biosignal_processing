% lab exercrise set 04
% exercise 2
% Lazaros Konstantinos-Panagiotis
% When tested with smaller values we get the very same result as the one shown in the solution section
% 01639

fs = 2200;
Ts = 1 / fs;
t = 0:Ts:1;
x = complex_exponent(2, 100, t, pi/4);
figure;
subplot(2,2,1);
plot(t, real(x));
title('Real part');
subplot(2,2,2);
plot(t, imag(x));
title('Imaginary part');
subplot(2,2,3);
plot(t, abs(x));
title('Absolute value');
subplot(2,2,4);
plot(t, angle(x));
title('Phase');

figure;
plot(x);