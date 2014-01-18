close all;
clear all;

data = load('data.mat');

basis_func = inline('x^t');

E_train = zeros(1, 10);
E_test = zeros(1, 10);
M_val = zeros(1, 10);

for i=0:9
	M_val(i+1) = i;
	w = normalEqn(data.x, data.y, i, basis_func);
	E_train(i+1) = calcERMS(w, data.x, data.y, i, basis_func);
	E_test(i+1) = calcERMS(w, data.x_test, data.y_test, i, basis_func);
end

figure;

plot(M_val, E_train, '-o');
hold on;
plot(M_val, E_test, 'r-o');
