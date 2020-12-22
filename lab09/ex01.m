% lab09
% exercise01
% Lazaros Konstantinos-Panagiotis
% 01639


clear all;

% load signal from ecg.mat
load ECG;
x = EKG1;
fs = 250;
Ts = 1 / fs;

% calculating ecg spectrum
y = fft(x);
K = length(y);
k = 1:K;
frequency = k*fs/K;
magnitude = abs(y);

% heart rate;
maxHRHz = 180/60;
index = int16(maxHRHz*K/fs);
[maxValue, maxIndex] = max(magnitude(1:index));
heartRate = 60*maxIndex*fs/K





