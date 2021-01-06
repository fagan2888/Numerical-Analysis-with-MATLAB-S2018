function [error,s] = SL(n)
%Summation from smallest to largest
%Finding Error
format long
 j = n:-1:1;
 s = sum(1./(j.*(j+1)));
 k= n/(n+1)-s;
 error=abs(k);
end


