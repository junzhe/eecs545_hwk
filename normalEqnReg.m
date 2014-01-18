function [theta] = normalEqnReg(x, y, M, f, fi)
        m = calcX(x, M, f);
	
	id = fi .* eye(length(x));	

        theta = inv(m'*m - id)*m'*y;
end

