%|---------------------------------|
%| lab10                           |
%| exercise03                      |
%| parts a and b                   |
%| Lazaros Konstantinos-Panagiotis |
%| 01639                           |
%|---------------------------------|

clear all;
load EEG.mat;
fs = 200;
N = 200;
brain_signal = eeg;
xmax = 4100;
noise = randn(N, length(brain_signal)); % these are the noise signals we have (they follow normal distribution)
ymax = max(brain_signal);
nb = []; % fill this up with brain_signal-noise combos 
noise = noise*max(brain_signal)*0.2;

% creating N noise-brain signals
for(l=1:N)
    nb(l,:) = brain_signal+noise(l,:);
end 


% denoising with average
denoised_brain_signal = mean(nb);

% starting to plot what we have
% plotting clean brain_signal
figure;
subplot(411);
plot(brain_signal);
axis([0 xmax -ymax ymax]);
title('Clean brain signal');

% plotting noise 
subplot(412);
plot(noise(1,:));
axis([0 xmax -ymax ymax]);
title('Noise');

% plotting noisy brain_signal
subplot(413);
plot(nb(1,:));
axis([0 xmax -ymax ymax]);
title('Brain signal with noise');

% plotting filtered out brain_signal
subplot(414);
plot(denoised_brain_signal);
axis([0 xmax -ymax ymax]);
title('Filtered brain signal (averaging method)');
