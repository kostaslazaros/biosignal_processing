%|---------------------------------|
%| lab10                           |
%| exercise02                      |
%| parts a and b                   |
%| Lazaros Konstantinos-Panagiotis |
%| 01639                           |
%|---------------------------------|

clear all;
fs = 200;
N = 200;
time = 0:1/fs:1;
sinusoid = 3*cos(2*pi*10*time); % this is the sinusoid
noise = randn(N, length(time)); % these are the noise signals we have (they follow normal distribution)
ns = []; % fill this up with sinusoid-noise combos 

% creating N noise-sinusoid signals
for(l=1:N)
    ns(l,:) = sinusoid+noise(l,:);
end 


% fft for frequency domain analysis
[freq, amp, phaz] = fftfun(ns(1,:), fs);

% denoising with average
denoised_signal = mean(ns);

% starting to plot what we have
% plotting clean sinusoid
figure;
subplot(511);
plot(time, sinusoid);
xlabel('Time (s)');
ylabel('Amplitude');
title('Clean sinusoid');

% plotting noise 
subplot(512);
plot(time, noise(1,:));
xlabel('Time (s)');
ylabel('Amplitude');
title('Noise');

% plotting noisy sinusoid
subplot(513);
plot(time, ns(1,:));
xlabel('Time (s)');
ylabel('Amplitude');
title('Sinusoid with noise');

subplot(514);
plot(freq, amp);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Sinusoid with noise in frequency domain');

% plotting filtered out sinusoid
subplot(515);
plot(time, denoised_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered sinusoid (averaging method)');
