% Lab 01
% Exercise 1
% By Lazaros Konstantinos-Panagiotis
% Serial number: 01639

clear all;

A = [1 1 1; 2 2 2; 3 3 3];

% Question 1
S = size(A);

% Question 2
T = A';

% Question 3
B = A(2,:);
C = A(3,:);

% Question 4
P = B * C';

% Question 5
M = ones(3);
D = A + M;

% Question 6
H = [A;zeros(2,3)];

% Question 7
% IMPORTANT: this command does not execute in my pc
xlswrite('table.xls', A);
