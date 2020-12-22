% Lab 01
% Exercise 3
% Part b
% SinusoidFun
% By Lazaros Konstantinos-Panagiotis
% Serial number: 01639

function [x] = sinusoidFun(t, A, f, phi)
  x = A * cos(2*pi*f*t + phi);
endfunction
