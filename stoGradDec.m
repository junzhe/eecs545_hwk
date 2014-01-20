function [w, dist] = stoGradDec(x, y, M, step_size, f, thresh)
	N = length(x);

	w0 = zeros(M+1, 1);
	w = w0;

	w_correct = [-0.13244; 12.71916; -37.15176; 24.63751];
	
	dist = [];

	diff = Inf;

	X = calcX(x, M, f);

	while diff > thresh
		w0 = w;
        	for i = 1:N
			w = w - (step_size * (w' * (X(i,:))' - y(i,:))) * (X(i,:))';
		end
		diff = norm(w - w0);

		dist = [dist, norm(w - w_correct)];
	end
end	
