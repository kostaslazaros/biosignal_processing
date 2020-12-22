% ----------------------------------
% lab exercise set no. 06          |
% exercise 01                      |
% parts a and b                    |
% Lazaros Konstantinos-Panagiotis  |
% 01639                            |
% ----------------------------------
% part a
% If we lower the time variable, the signal will be barely hearable
% If we lower the frequency we will notice that the plots are far less dense
% Which means that we the plot is a bit cleaner

% part b
% if the filter has lower values the result sound a bit blurier than before
% if the filter has higher values the highest value of the frequency response becomes smaller
% if the filter is smaller in length the frequency response changes and the signal becomes a bit less dense
% if the filter is bigger in length the filtering becomes a bit more precise?


fs = 100;
Ts = 1/fs;
t = 1:Ts:100;
f = 1;

% generate a noisy signal
x1 = sinusoid(t, 10, f, 0);
x2 = noiseFun(5, t);
x3 = x1 + x2;

% plot the noisy signal
subplot(5,1,1);
plot(x3);
grid on;
title('Noisy signal');
sound(x3);

% plot spectrum of the noisy signal
[fre, mag, pha] = fftfun(x3, fs);
subplot(5,1,2);
plot(fre, mag);
grid on;
title('Noisy signal spectrum');

% FIR filtering of the signal (moving average)
firFilter = [1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8];
x4 = conv(firFilter, x3);
subplot(5,1,3);
plot(x4);
grid on;
title('Filtered signal');
sound(x4);

% Frequency response of the filter
w = -pi: (pi / 100) : pi;
frere = freqz(firFilter, 1, w);
subplot(5,1,4);
plot(w, frere);
grid on;
title('Frequency response of filter');



% Spectrum of filtered signal
[fre, mag, pha] = fftfun(x4, fs);
subplot(5,1,5);
plot(fre, mag);
grid on;
title('filtered signal spectrum');
