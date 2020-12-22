%-----------------------------------
% lab 08                           |
% Exercise 03                      |
% cases a and b                    |
% Lazaros Konstantinos-Panagiotis  |
% 01639                            |
%-----------------------------------


% important note!!! smooth function does not exist in octave
% same goes for yulewalk!!!
% the used vsmooth function has been copied by matlab's public archive
% in order for it to work in octave it has to be used with the nan package
% the signal package is also required for these to run


% observations for both a and b:
% although the requested frequencies have been cancelled out of our signal
% for some reason other frequencies tend to increase a bit
% maybe it has to do with the use of the yulewalk function
% thus we could say that for the given case, our fir filter does the job a bit better(?)

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

% calculate ECG spectrum
y = fft(x);
K = length(y);
k = 1:K;
frequency = k*fs/K;
magnitude = abs(y);


% plot ECG spectrum
figure;
subplot(411); 
plot(frequency, magnitude);
xlabel('Frequency (Hz)');
title('Frequency response');
ylabel('Magnitude');


% filter other frequency noise (band rejection)
cutoff11 = 45;
cutoff12 = 55;
cutoff21 = 39;
cutoff22 = 120;
%cutoffNorm = 2*cutoff/fs;
% filter baseline wander (high pass)


% creating a band pass (iir)filter for frequency of 50 Hz
cutoffNorm11 = 2*cutoff11/fs;
cutoffNorm12 = 2*cutoff12/fs;
cutoffNorm21 = 2*cutoff21/fs;
cutoffNorm22 = 2*cutoff22/fs;

f1 = [0 cutoffNorm11 cutoffNorm12 1];
f2 = [0 cutoffNorm21 cutoffNorm22 1];
m1 = [1 0 0 1];
m2 = [1 0 0 1];


xx = x - vsmooth(x, L);
magxx = abs(fft(xx));
subplot(412);
plot(frequency, magxx);
xlabel('Frequency (Hz)');
title('Halfway through processing');
ylabel('Magnitude');


h1 = yulewalk(8, f1, m1);
h2 = yulewalk(8, f2, m2); 
y1 = filter(h1, 1, xx);
y2 = filter(h2, 1, xx);
v1 = fft(y1);
v2 = fft(y2);
iy1 = ifft(v1);
iy2 = ifft(v2);

mag1 = abs(v1);
mag2 = abs(v2);

subplot(413);
plot(frequency, mag1);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Filtered result for the first case (case a)');


subplot(414);
plot(frequency, mag2);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Filtered result for the second case (case b)');


xmax = 3000;
ymax = 500;
figure;
subplot(311)
plot(x);
axis([0 xmax -ymax ymax]);
title('Raw ECG');
subplot(312);
plot(real(iy1)); 
axis([0 xmax -ymax ymax]);
title('Processed ECG (case a)');
subplot(313);
plot(real(iy2)); 
axis([0 xmax -ymax ymax]);
title('Processed ECG (case b)');
