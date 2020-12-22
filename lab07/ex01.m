% lab example implementation for exercise number 01
% Lazaros Konstantinos-Panagiotis
% 01639
% If we lower the order of the iir filter we have here it will get closer to the ideal fir filter
% if we lower the order of the filter to 5 we will get the same result as the fir


f=[0 0.6 0.6 1];
m = [1 1 0 0];
[b,a] = yulewalk(5, f, m);
[H, w] = freqz(b, a, 128);

hold on;
plot(f, m, 'b');
plot(w/pi,  abs(H), 'r');
xlabel('Normalized Frequency');
ylabel('Magnitude');
legend('Ideal', 'Yule-Walker designed');
legend boxoff;
title('Comparison of Frequency Response Magnitudes');
hold off;