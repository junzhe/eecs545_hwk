function [E] = calcError(w, x, y, M, f)
	X = calcX(x, M, f);

	e = (X * w - y).^2;

	E = 1/2 * sum(e);
end
