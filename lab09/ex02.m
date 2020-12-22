% lab09
% exercise02
% parts a and and b
% Lazaros Konstantinos-Panagiotis
% 01639

clear all;

% load signals from ecg.mat
load ECG;
x = EKG1;
fs = 250;
h = [-1 1];

% here we take the maxima 
d = conv(x, h);
maxima = [];
minima = [];

for z=1:length(x)
    if ((d(z) <=0) & (d(z+1) > 0))
      maxima(z) = x(z);
    else
      maxima(z) = 0;
    end
end

for z=1:length(x)
  if ((d(z) >=0) & (d(z+1) < 0))
    minima(z) = x(z);
  else
    minima(z) = 0;
  end
end




max_thres = 270;
min_thres = -22;
maxima = (maxima > max_thres) .* maxima;
minima = (minima < min_thres) .* minima;
% calculate the ecg spectrum
y = fft(x);
K = length(y);
k = 1:K;
frequency = k*fs/K;
magnitude = abs(y);


% filter baseline wander (high pass)
cutoffHz = 0.5;
cutoffIndex = int16(cutoffHz*K/fs);
y(1:cutoffIndex) = 0; %manual filtering
y(K-cutoffIndex:K) = 0; %manual filtering symmetric

% inverse fourier to get filtered signal
iy = ifft(y);
output = real(iy);


% display output signal
xmax = 3000;
ymax = 500;
figure;
subplot(211);
plot(x);
axis([0 xmax -ymax ymax]);
title('Raw ECG signal');
subplot(212);
plot(output);
axis([0 xmax -ymax ymax]);
title('Filtered ECG signal');


% signal analysis
% pattern matching part!!!
figure;
pattern = output(445:500);
lo = length(output);
lp = length(pattern);
plot(pattern);
title('Original pattern for pattern matching');

cor = [];

for(l=1:K-lp)
    cor(l) = corr(output(l:l+lp-1),pattern);
end

maxIndices = [];
threshold = 95/100; % we want 95% similarity!!!
index = 0;

for(l=1:length(cor))
    if (cor(l) > threshold)
      index = index + 1;
      maxIndices(index) = 1;
    end
end

figure;
hold on;

plot(output, 'b');
plot(cor*300, 'r');
axis([0 xmax -1 1]);
axis([0 xmax -ymax ymax]);
title('Correlation of pattern across ECG signal');
hold off;


% let's display some of the detected patterns to validate!!!

for (l=30:35)
  patternNo = l;
  figure;
  plot(output);
  hold on;
  plot(maxima, 'ro');
  hold on;
  plot(minima, 'ro');
  axis([maxIndices(patternNo) maxIndices(patternNo)+lp -ymax ymax]);
  title(['Detected pattern' sprintf('%f', patternNo)]);
end
