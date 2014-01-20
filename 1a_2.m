close all;
clear all;

data = load('data.mat');

basis_func = inline('x^t');

[w, dist] = stoGradDec(data.x, data.y, 3, 0.1, basis_func, 0.000001);

w

plot([1:length(dist)], dist, '-');
