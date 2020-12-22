% lab09
% exercise03
% Lazaros Konstantinos-Panagiotis
% 01639
% the comparisson will happen between the example we have at exercise 1 and the given example from the exercise file.

% the maximum beat value we have is around 73.483 bpm
% with the method implemented in the first exercise we get a beat rate of 68.807 bpm.
% now, if we see the plot of the beat rate we will see that the bit rate is not constant. We have a lot of different values.
% thus we could come to the conclusion that the patient has arrythmia!!! 


clear all;
load ECG;
x = EKG1;
fs = 250;
Ts = 1/fs;
h = [-1 1];
d = conv(x, h);
maxima = [];

for z=1:length(x)
    if((d(z) <= 0) & (d(z+1) > 0))
      maxima(z) = x(z);
    else
      maxima(z) = 0;
    end
end

threshold = 270;
maxima = (maxima > threshold) .* maxima;


d_array = [];
zeros_count = 0;
total_peaks = 0;
for z=1:length(maxima)
    if (maxima(z) > 0)
        total_peaks = total_peaks + 1;
        d_array(total_peaks) = zeros_count;
        zeros_count = 0;
    else
        zeros_count = zeros_count + 1;
    end
end

t_arr = d_array * Ts;
heartRate = 60 * 1 ./ t_arr;

figure;
mag_heart = length(heartRate);
plot(heartRate(2:mag_heart));
















