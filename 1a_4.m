clear all;
close all;

load mnist_49_3000;

basis_func = inline('exp(-(x.^2)./10)');

sig = inline('1.0./(1.0 + exp(-z))');

X = [ones(1, 2000); x(:,1:2000)];

w = newtonLog(X, y(:, 1:2000)', basis_func, 0.000000001);

x_test = [ones(1, 1000); x(:, 2001:3000)];

X_test = basis_func(x_test);

prob = sig(w' * X_test)';

correct = 0;
for i=1:length(prob)
	predict = y(:, 2000+i);
	if prob(i) > 0.5 && predict==1
		correct++;
	elseif prob(i) <= 0.5 && predict== -1
		correct++;
	elseif prob(i) > 0.9 && predict == -1
		showDigit(x, y, 2000+i);
	elseif prob(i) <= 0.1 && predict == 1
		showDigit(x, y, 2000+i);
	end 
end

correct/1000 
		
