% Lab03 
% Exercise 3 gaussian white noise function
% Lazaros Konstantinos-Panagiotis
% 01639

function [x] = noiseFun (A, t)
  x = A * randn(1, length(t));
endfunction
