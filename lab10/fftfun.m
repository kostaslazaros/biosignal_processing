% Lab 08
% fft homemade
% Lazaros Konstantinos-Panagiotis
% 01639


function [frequency, magnitude, phase] = fftfun (x, fs)
  y = fft(x);
  m = length(y);
  frequencyAxis = (0:m) * fs/m;
  fftMagnitude = abs(y);
  fftPhase = angle(y);
  frequency = [-(frequencyAxis(m)-frequencyAxis(m/2:m)), frequencyAxis(1:m/2)];
  magnitude = [fftMagnitude(m/2:m), fftMagnitude(1:m/2)];
  phase = [fftPhase(m/2:m), fftPhase(1:m/2)];
endfunction
