function[maxerr,connum]=interp3(n,v) %Interpolation using evenly spaced points and Chebyshev polynomials

f = @(x) 1./(1+25*x.^2);

coeff=ones(1001,n+1);
w=linspace(-1,1,1001); 

    y=f(v);       %column of values of the function on interpolation points
    ye=f(w);
    
    for j=2:n+1
    coeff(:,j)=cos((j-1).*acos(w));
    end
                                   %column of unknowns                              
    A= coeff\(ye)';                          % coeff*A=ycolumn of the coefficients of the polynomial
    connum = cond(coeff);               %condition number of V
  
 pe=coeff*A;             %interpolation
 %plot(w,ye,v,y,'o');               % plot f(x) and mark nodes with 'o'.
%hold on
 %plot(w,pe);
 %hold off
maxerr = norm(ye-pe,Inf) ;          %maximum error
plot(w,ye-pe);
grid on;
%plot(w,);
title('Interpolation error')

end
