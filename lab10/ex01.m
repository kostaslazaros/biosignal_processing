%|---------------------------------|
%| lab10                           |
%| exercise01                      |
%| Lazaros Konstantinos-Panagiotis |
%| 01639                           |
%|---------------------------------|

clear all;
load EEG.mat;
N = 4;
fs = 200;
time = 0:1/fs:(length(eeg)-1 ) * 1/fs;

% Delta waves
Wn_d = 2*4/fs;
[b,a] = butter(N, Wn_d);
delta = filter(b, a, eeg);

% Frequency domain verification for delta waves
in_vect = delta;
[freq, amp, phaz] = fftfun(in_vect, fs);
figure(1);
title('Frequency content');
hold on;
subplot(221);
plot(freq, amp);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Delta waves');

% Theta waves
W1 = 2*4/fs;
W2 = 2*8/fs;
Wn_t = [W1 W2];
[c, d] = butter(N, Wn_t);
theta = filter(c, d, eeg);

% Frequency domain verification for theta waves
in_vect = theta;
[freq, amp, phaz] = fftfun(in_vect, fs);
figure(1);
subplot(222);
plot(freq, amp);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Theta waves');

% Alpha waves
W3 = 2*8/fs;
W4 = 2*13/fs;
Wn_a = [W3 W4];
[e,f] = butter(N, Wn_a);
alpha = filter(e, f, eeg);

% Frequency domain verification
in_vect = alpha;
[freq, amp, phaz] = fftfun(in_vect, fs);
subplot(223);
plot(freq, amp);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Alpha waves');


% Beta waves;
W5 =  2*13/fs;
W6 = 2*40/fs;
Wn_b = [W5 W6];
[g,h] = butter(N, Wn_b);
beta = filter(g, h, eeg);


% Frequency domain verification
in_vect = beta;
[freq, amp, phaz] = fftfun(in_vect, fs);
subplot(224);
plot(freq, amp);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Beta waves');
hold off;

% Frequency of raw signal
in_vect = eeg;
[freq, amp, phaz] = fftfun(in_vect, fs);
figure;
plot(freq, amp);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Raw EEG signal');


% Figures
figure;
hold on;
title('EEG wave patterns');
subplot(511);
plot(time, eeg);
xlabel('Time (s)');
ylabel('Amplitude');
title('Raw EEG signal');
subplot(512);
plot(time, delta);
xlabel('Time (s)');
ylabel('Amplitude');
title('Delta waves');
subplot(513);
plot(time, theta);
xlabel('Time (s)');
ylabel('Amplitude');
title('Theta waves');
subplot(514);
plot(time, alpha);
xlabel('Time (s)');
ylabel('Amplitude');
title('Alpha waves');
subplot(515);
plot(time, beta);
xlabel('Time (s)');
ylabel('Amplitude');
title('Beta waves');
hold off;
