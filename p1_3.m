close all;
clear all;

data = load('data.mat');

basis_func = inline('x^t');

E_train = zeros(1, 41);
E_test = zeros(1, 41);
fis = zeros(1, 41);
fis_ln = zeros(1, 41);

for i = 0:40
	fis(i+1) = exp(-(i));
	fis_ln(i+1) = -i;
end

for i=0:40
        w = normalEqnReg(data.x, data.y, 9, basis_func, fis(i+1));
        E_train(i+1) = calcERMS(w, data.x, data.y, 9, basis_func);
        E_test(i+1) = calcERMS(w, data.x_test, data.y_test, 9, basis_func);
end

figure;

plot(fis_ln, E_train, '-o');
hold on;
plot(fis_ln, E_test, 'r-o');

