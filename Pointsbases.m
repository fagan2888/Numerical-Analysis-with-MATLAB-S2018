%i.Evenly spaced points and monomials as the basis
intpnts = linspace(-1,1,n);
%ii.Evenly spaced points and Chebyshev polynomials as the basis
T = @(x) cos((0:n).*acos(x));
%iii.Chebyshev points and monomials as the basis
intpnts = -cos(((0:n)./(n))*pi);
%iv.Chebyshev points and polynomials
intpnts = -cos(((0:n)./(n))*pi);
T = @(x) cos((0:n).*acos(x));



%Create matrix V with basis Chebyshev polynomials
for i =1:n+1
    for j=1:n+1
    A(i,j)=cos((j-1)*acos(intpnts(i)));
    end
end