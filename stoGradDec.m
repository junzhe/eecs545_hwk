function [w] = stoGradDec(x, y, M, step_size, f, thresh)
	N = length(x);

	w0 = zeros(M+1, 1);
	w = w0;

	diff = Inf;

	X = calcX(x, M, f);

	while diff > thresh
		w0 = w;
        	for i = 1:N
			w = w - (step_size * (w' * (X(i,:))' - y(i,:))) * (X(i,:))';
		end
		diff = norm(w - w0);
	end
end	
