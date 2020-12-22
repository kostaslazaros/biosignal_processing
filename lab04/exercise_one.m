% lab exercrise set 04
% exercise 1
% parts a, b and c
% Lazaros Konstantinos-Panagiotis
% 01639



fs = 44100;
Ts = 1 / fs;
t = 0:Ts:1;

% part a
x1 = sinusoid(t, 440, 1, 0);
subplot(3,1,1);
plot(t, x1);
axis([0 0.05 -1.2 1.2]);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Sinusoid wave');

x2 = square(2*pi*440*t);
subplot(3,1,2);
plot(t, x2);
axis([0 0.05 -1.2 1.2]);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Square periodic wave');

x3 = sawtooth(2*pi*440*t);
subplot(3,1,3);
plot(t,x3);
axis([0 0.05 -1.2 1.2]);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Sawtooth wave');



% part b 
x = [x1 x2 x3];
t1 = Ts * (0:length(x) -1);
figure;
plot(t1, x);


% part c
sound(x, fs);

