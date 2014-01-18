close all;
clear all;

data = load('data.mat');

basis_func = inline('x^t');

w = stoGradDec(data.x, data.y, 3, 0.1, basis_func, 0.00001);

w

