clear all;
close all;

load mnist_49_3000;

basis_func = inline('x');

sig = inline('1.0./(1.0 + exp(-z))');

for i=1:length(y)
	if y(:,i) == -1
		y(:,i) = 0;
	end
end

X = [ones(1, 2000); x(:,1:2000)];

w = newtonLog(X, y(:, 1:2000)', basis_func, 0.00001);

x_test = [ones(1, 1000); x(:, 2001:3000)];

X_test = basis_func(x_test);

prob = sig(w' * X_test)';

mis_list = [];

correct = 0;
for i=1:length(prob)
	predict = y(:, 2000+i);
	if prob(i) > 0.5 && predict==1
		correct++;
	elseif prob(i) <= 0.5 && predict== 0
		correct++;
	elseif prob(i) > 0.5 && predict == 0
		mis_list = [mis_list;[abs(1-2*prob(i)), i]];
	elseif prob(i) <= 0.5 && predict == 1
		mis_list = [mis_list;[abs(1-2*prob(i)), i]];
	end 
end

mis_list_sorted = sortrows(mis_list,1);

for i=length(mis_list_sorted):-1:length(mis_list_sorted)-19
	mis_list_sorted(i,1)
	showDigit(x, y, 2000+mis_list_sorted(i,2));
	pause;
end

correct/1000 
		
