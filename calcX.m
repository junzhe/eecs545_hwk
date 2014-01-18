function [X] = calcX(x, M, f)
	X = zeros(length(x), M+1);
	
	l = length(x);

        for i = 1:l
                for j = 0:M
                        X(i, j+1) = f(j, x(i,:));
                end
        end
end
