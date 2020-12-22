% Lazaros Konstantinos-Panagiotis
% 01639

function [x] = sinusoid (t, f, A, phi)
  omega = 2*pi*f;
  x = A * cos(omega*t + phi);

endfunction
