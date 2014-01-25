function [w] = newtonLog(x, t, f, thresh)
	sig = inline('1.0./(1.0+exp(-x))');

	[M, N] = size(x);

	R = zeros(N, N);

	w0 = zeros(M, 1);
	w = w0;

	y = zeros(N, 1);

	diff = Inf;

	X = f(x');
	
	J = 0;

	while diff > thresh
		w0 = w;

		y = X * w;
		y = sig(y);

%		grad = X' * (y-t);
%		H = X' * diag(y) * diag(1-y) * X;
		
%		w = w - H\grad;

		R = diag(y) * diag(1-y);
	
		z = X * w - pinv(R) * (y - t);
		w = pinv(X'*R*X + 10.*eye(M))*X'*R*z;

		J =sum(-t.*log(y) - (1-t).*log(1-y));

		diff = norm(w-w0);
	end

	J
end	
