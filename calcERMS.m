function [E] = calcERMS(w, x, y, M, f)
        N = length(x);

	E = calcError(w, x, y, M, f);

	E = sqrt(2*E/N);
end

