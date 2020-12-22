% Lazaros Konstantinos-Panagiotis
% 01639

function [x] = pulse (t, duration, t0)
  start = t0;
  finale = start + duration;
  x = (t >= start) & (t <= finale);
endfunction
