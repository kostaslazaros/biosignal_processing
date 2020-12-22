% lab exercrise set 04
% manual chirp 
% Lazaros Konstantinos-Panagiotis
% 01639


function [x] = chirp_manual (f1, f2, t, T2, phi)
  x = ((f2 - f1) / T2) * pi * t .^2 + 2 * f1 * pi * t + phi;
endfunction
