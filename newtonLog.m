function [w] = newtonLog(x, t, f, thresh)
	sig = inline('1/(1+exp(-x))');

	[M, N] = size(x);

	R = zeros(N, N);

	w0 = zeros(M, 1);
	w = w0;

	y = zeros(N, 1);

	diff = Inf;

	X = zeros(N, M);

	for i = 1:N
		for j=1:M
			X(i,j) = f(x'(i,j));
		end
	end

	while diff > thresh
		w0 = w;
		for i=1:N
			y(i,:) = sig(w' * X(i, :)');
			R(i, i) = y(i, :) * (1 - y(i,:));
		end
	
		z = X * w0 - pinv(R) * (y - t);
		w = inv(X'*R*X - 10.*eye(M))*X'*R*z;
	
		diff = norm(w - w0);

		diff
	end
end	
