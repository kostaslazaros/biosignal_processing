% Lab03 
% Exercise 1 part c
% Lazaros Konstantinos-Panagiotis
% 01639

function [x] = sinusoid (t, t0, f, A, phi)
  omega = 2*pi*f;
  x = A * cos(omega .* (t-t0) + phi);
endfunction
