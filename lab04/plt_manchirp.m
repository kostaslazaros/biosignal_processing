% lab exercrise set 04
% exercise 4
% Lazaros Konstantinos-Panagiotis
% 01639

fs = 44100;
Ts = 1 / fs;
T2 = 3;
t = 0:Ts:2;
y = chirp_man(220, 2320, t, T2, 0);
x = cos(y);
plot(t, x);
axis([0 0.5 -1 1]);
sound(x, fs);
