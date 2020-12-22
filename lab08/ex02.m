%-----------------------------------
% lab 08                           |
% Exercise 02                      |
% Lazaros Konstantinos-Panagiotis  |
% 01639                            |
%-----------------------------------


% important note!!! smooth function does not exist in octave
% the used vsmooth function has been copied by matlab's public archive
% in order for it to work in octave it has to be used with the nan package
% the signal package is also required for these to run
% part a observations
% the fir filters we use are not ideal and thus don't completely zero out the requested frequencies
% despite this, they still do pretty good work!!
% we don't necessarily have to use ifft in the and (we already have it)

clear all;

% load signals from ECG.mat
load ECG; % contains 2 signals EKG1 and EKG2
x = EKG2;
fs = 250; 
L = 150;

% power line interference sim
n = 1:length(x);
Ts = 1 /fs;
p = 20*cos(2*pi*50*n*Ts);
x = x + p';

xx = x - vsmooth(x, L);


% calculate ECG spectrum
y = fft(x);
K = length(y);
k = 1:K;
frequency = k*fs/K;
magnitude = abs(y);





% filter other frequency noise (band rejection)
cutoff11 = 45;
cutoff12 = 55;
%cutoffNorm = 2*cutoff/fs;
% filter baseline wander (high pass)


% creating a band pass filter for frequency of 50 Hz
cutoffNorm11 = 2*cutoff11/fs;
cutoffNorm12 = 2*cutoff12/fs;
f1 = [0 cutoffNorm11 cutoffNorm12 1];
m1 = [1 0 0 1];
h1 = fir2(30, f1, m1);

cutoff21 = 40;
cutoff22 = 100;
cutoffnorm21 = 2 * cutoff21 / fs;
cutoffnorm22 = 2 * cutoff22 / fs;
f2 = [0 cutoffnorm21 cutoffnorm22 1];
m2 = [1 0 0 1];
h2 = fir2(30, f2, m2);
y2 = filter(h2, 1, xx);
v2 = fft(y2);

% This part here is universal for both cases!!!


% Convolution and fft of convolution in order to get the frequency response
y1 = filter(h1, 1, xx);
v1 = fft(y1);




% plot ECG spectrum
figure;
subplot(411); 
plot(frequency, magnitude);
xlabel('Frequency (Hz)');
title('Frequency response');
ylabel('Magnitude');

magxx = abs(fft(xx));
subplot(412);
plot(frequency, magxx);
xlabel('Frequency (Hz)');
title('Halfway through processing (smooth applied)');
ylabel('Magnitude');


magnitude = abs(v1);
subplot(413);
plot(frequency, magnitude);
xlabel('Frequency (Hz)');
title('Filtered frequency response (case a)');
ylabel('Magnitude');


magnitude=abs(v2);
subplot(414);
plot(frequency,magnitude);
xlabel('Frequency (Hz)');
title('Filtered frequency response (case b)');
ylabel('Magnitude');


% IFFT to get processed resulting signal
iy = ifft(v1);
iy2 = ifft(v2);


% display output signals
xmax = 3000;
ymax = 500;
figure;
subplot(411)
plot(x);
axis([0 xmax -ymax ymax]);
title('Raw ECG');
subplot(412);
plot(real(iy)); 
axis([0 xmax -ymax ymax]);
title('Processed ECG');

subplot(413);
plot(x);
axis([0 xmax -ymax ymax]);
title('Raw ECG (second case)');

subplot(414);
plot(real(iy2));
axis([0 xmax -ymax ymax]);
title('Processed ECG (second case)')
