% Lab 05
% sinc function
% Exercise 02
% Lazaros Konstantinos-Panagiotis
% 01639

function [x] = sinc_fun (t)
  if t == 0
    x = 1;
  else
    x = sin(pi * t) ./ (pi * t);
  endif
endfunction
