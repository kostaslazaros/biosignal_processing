% lab exercrise set 04
% am signal function
% if we change cos(x) to sin(x - pi/2) we will get the very same result in the plot
% Lazaros Konstantinos-Panagiotis
% 01639



function [x] = am_signal (f1, f2, A, t)
  x = A * (cos(2*pi*f1*t) .* sin(2*pi*f2*t));
  

endfunction
