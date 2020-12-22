% Lab 05
% Lazaros Konstantinos-Panagiotis
% 01639

fs = 1000;
Ts = 1/fs;
tmin = 0;
tmax = 10;
t = tmin:Ts:tmax;
f = 100;
A = 10;
phi = 0;
x = A * cos(2*pi*f*t+phi);
[frequency, magnitude, phase] = fftfun(x, fs);
figure;
subplot(2,1,1);
plot(frequency, magnitude);
xlabel('Frequency(Hz)');
ylabel('Magnitude');
subplot(2,1,2);
plot(frequency, phase);
xlabel('Frequency(Hz)');
ylabel('Phase');