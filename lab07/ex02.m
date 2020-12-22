% second exercise
% Lazaros Konstantinos-Panagiotis
% 01639
% checking if systems are stable

%part a
% This is an unstable system
f = [-1.5:0.1:1.5];
b1 = [2 2];
a1 = [1 -1.25];
[H1, w1] = freqz(b1, a1, f);
[h1, t1] = impz(b1, a1);
poles = roots(a1);
zero_parts = roots(b1);

figure;
subplot(4,1,1);
plot(h1);
title('Impulse response');

subplot(4,1,2);
zplane(b1,a1);
title('Pole-zero plot');

subplot(4,1,3);
plot(w1, abs(H1));
title('Freq/Magnitude response');


subplot(4,1,4);
plot(w1/pi, angle(H1));
title('Freq/phase response');


% part b
% This here is a stable system
b2 = [2, 2];
a2 = [1, -0.8];
[H2, w2] = freqz(b2, a2, f);
[h2, t2] = impz(b2, a2);
poles2 = roots(a2);
zero_parts2 = roots(b2);

figure;
subplot(4,1,1);
plot(h2);
title('Impulse response');

subplot(4,1,2);
zplane(b2,a2);
title('Pole-zero plot');

subplot(4,1,3);
plot(w2, abs(H2));
title('Freq/Magnitude response');

subplot(4,1,4);
plot(w2/pi, angle(H2));
title('Freq/phase response');













