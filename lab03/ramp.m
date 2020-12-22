% Lab03 
% Exercise 1 part a
% Lazaros Konstantinos-Panagiotis
% 01639

function [x] = ramp(t, t0)
  x = (t - t0) .* (t >= t0);
endfunction
