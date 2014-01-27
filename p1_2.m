close all;
clear all;

data = load('data.mat');

basis_func = inline('x^t');

w_correct = [-0.13244; 12.71916; -37.15176; 24.63751];

[w, dist] = stoGradDec(data.x, data.y, 3, 0.1, basis_func, 0.000001, w_correct);

w

plot([1:length(dist)], dist, '-');

sdg_error = calcError(w, data.x_test, data.y_test, 3, basis_func)

anal_error = calcError(w_correct, data.x_test, data.y_test, 3, basis_func)


