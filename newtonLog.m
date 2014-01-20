function [w] = newtonLog(x, t, f, thresh)
	sig = inline('1.0./(1.0+exp(-x))');

	[M, N] = size(x);

	R = zeros(N, N);

	w = zeros(M, 1);

	y = zeros(N, 1);

	diff = Inf;

	X = x';
	
	J_p = 0;
	J = J_p;

	while diff > thresh
		J_p = J;
		y = X * w;
		y = sig(y);

		grad = X' * (y-t);
		H = X' * diag(y) * diag(1-y) * X;
		
		w = w - H\grad;

		%R = diag(y) * diag(1-y);
	
		%z = X * w - pinv(R) * (y - t);
		%w = pinv(X'*R*X)*X'*R*z;

		J = sum(-t.*log(y) - (1-t).*log(1-y));	
	
		diff = J - J_p;
	end

	J
end	
