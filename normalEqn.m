function [theta] = normalEqn(x, y, M, f)
	m = calcX(x, M, f);

	theta = inv(m'*m)*m'*y;
end
