% ----------------------------------
% lab exercise set no. 06          |
% exercise 02                      |
% parts a, b and c                 |
% Lazaros Konstantinos-Panagiotis  |
% 01639                            |
% ----------------------------------

fs = 1000;
Ts = 1 / fs;
t = 0:Ts:10;
A = 10;
x1 = sinusoid(t, A, 10, 0);
x2 = sinusoid(t, A, 20, 0);
x3 = sinusoid(t, A, 30, 0);
x4 = sinusoid(t, A, 100, 0);
xtotal = x1 + x2 + x3 + x4;

subplot(5,1,1);
plot(t, xtotal);
grid on;
title('Signal without filter');

[fre, mag, pha] = fftfun(xtotal, fs);
subplot(5,1,2);
plot(fre, mag);
title('Frequency domain with fourier transform');


% part a
% in order to create a normalized frequency we will use the Nyquist-Shannon theorem
% according to it: fn = (2 * f) / fs

fcut1 = 50;
fcut1Normalized = 2 * fcut1 / fs;  
% below we see the low pass filter
% it will cut-off every frequency above 50Hz
% in order to make the low pass filter work
% you will have to open the comments in this and close the comments at the band pass filter
f = [0 fcut1Normalized fcut1Normalized 1];
m = [1 1 0 0];

% part b
% below we see the high pass filter
% it will cut-off every frequency below 50Hz
% we use the same fcut1Normalized variable and f table as the threshold is at 50Hz once again
% you will have to comment out the m above and open the one right below in order to get the hpf
%m = [0 0 1 1];


% part c
% below we see the band pass filter
% it will cut-off every frequency below 15Hz and above 35Hz
% we will have to normalize new data to create thresholds
% let's do this!!!
fcut21 = 15;
fcut22 = 35;
fcut21Normalized = 2 * fcut21 / fs;
fcut22Normalized = 2 * fcut22 / fs;
%f = [0 fcut21Normalized fcut21Normalized fcut22Normalized fcut22Normalized 1];
%m = [0 0 1 1 0 0];



% this little part is universal
h = fir2(30, f, m);
[H, w] = freqz(h, 1, 128);

% ...as well as this little part below!!!
% plotting happens here!!!
subplot(5,1,3);
plot(f, m, 'b');
hold on;
plot(w / pi, abs(H), 'r');
title('Ideal fir designed');

filteredRes = conv(xtotal, h);
subplot(5,1,4);
plot(filteredRes, 'g');
title('Final filtered function/signal');

[fre, mag, pha] = fftfun(filteredRes, fs);
subplot(5,1,5);
plot(fre, mag);
title('filtered spectrum');









