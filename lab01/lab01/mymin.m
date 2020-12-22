% Lab 01
% Exercise 4
% By Lazaros Konstantinos-Panagiotis
% Serial number: 01639

function [y] = mymin(X)
  sz = size(X);
  if (min(sz) == 1 && ndims(X) == 2) 
    y = min(X);
  else
    y = false;
    disp('Σφάλμα!!! Το σήμα δεν είναι μονοδιάστατο');
  end
endfunction
