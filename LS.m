function [error,s] = LS(n)
%Summation from largest to smallest
%Finding Error
format long
 j = 1:n;
 s = sum(1./(j.*(j+1)));
 k= n/(n+1)-s;
 error=abs(k);
end