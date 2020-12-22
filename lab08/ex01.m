%-----------------------------------
% lab 08                           |
% Exercise 01                      |
% Lazaros Konstantinos-Panagiotis  |
% 01639                            |
%-----------------------------------

% part a observations:
% 1) For EKG1 the output plots are changed in a less noticable way
% 2) For EKG2 the output plot have a noticable change. They are not filtered out and thus there is no processed output

% part b
% in this case the spectrum is indeed being properly aligned!!

% part c
% if we apply the noise signal and increase the amplitude we will see that there is more noise in our starting signal than before
% but then when we apply the filtering we see that it all goes back to normal (without noise in)


%part d
% if we wanted to lower the variance due to noise above 40 hz
% we can just change parameters cutoff1 and cutoff2
% cutoff1 will be equal with 40
% cutoff2 will be equal with 150

clear all;

% load signals from ECG.mat
load ECG; % contains 2 signals EKG1 and EKG2
x = EKG2;
fs = 250; 

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
subplot(211); 
plot(frequency, magnitude);
xlabel('Frequency (Hz)');
ylabel('Magnitude');


% filter baseline wander (high pass)
cutoff = 0.5;
cutoffIndex = int16(cutoff*K/fs);
y(1:cutoffIndex) = 0; % manual filtering
y(K - cutoffIndex:K) = 0; % manual filtering(symmetric)


% filter other frequency noise (band rejection)
cutoff1 = 40;
cutoff1Index = int16(cutoff1*K/fs);
cutoff2 = 150;
cutoff2Index = int16(cutoff2*K/fs);
y(cutoff1Index:cutoff2Index) = 0; % manual filtering
y(K - cutoff2Index:K-cutoff1Index) = 0; % manual filtering (symmetric)


magnitude = abs(y);
subplot(212);
plot(frequency, magnitude);
xlabel('Frequency (Hz)');
ylabel('Magnitude');


% IFFT to get processed resulting signal
iy = ifft(y);


% display output signals
xmax = 3000;
ymax = 500;
figure;
subplot(211)
plot(x);
axis([0 xmax -ymax ymax]);
subplot(212);
plot(real(iy)); 
axis([0 xmax -ymax ymax]);
