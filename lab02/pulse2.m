% Lazaros Konstantinos-Panagiotis 
% 01639

function [x] = pulse2 (t, duration, t0)
  start = t0
  ending = duration + t0;
  x = unitStepFun(t, start) - unitStepFun(t, ending);

endfunction
