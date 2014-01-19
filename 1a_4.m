clear all;
close all;

load mnist_49_3000

basis_func = inline('exp(-(x^2)/2)');

X = [ones(1, 2000); x(:,1:2000)];

w = newtonLog(X, y(:, 1:2000)', basis_func, 0.01);

w

