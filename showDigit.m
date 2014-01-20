function [] = showDigit(x,y,i)
	[d,n] = size(x);
	y(:,i)
	imagesc(reshape(x(:,i),[sqrt(d),sqrt(d)])');
end
