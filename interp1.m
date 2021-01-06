function[maxerr,connum]=interp1(n) %Using chebyshev points and monomial basis

    f = @(x) 1./(1+25*x.^2);
    
coeff=ones(1001,n+1);
%coeff1=ones(n+1);

%v=-cos(((0:n)./n)*pi);
w=-cos(((0:1000)./1000)*pi); 
   % y=f(v);       %column of values of the function on interpolation points
    ye=f(w);
    
    for j=2:n+1
        for i=1:1000
        %coeff1(:,j)=coeff1(:,j-1)'.*v;
        coeff(i,j)=-cos((i/(n+1))*pi)^(j-1)';%Vandermonde matrix 
        end 
    end
   
    %B=coeff1\y';                          %column of unknowns
    A= coeff\(ye)';             % coeff*A=ycolumn of the coefficients of the polynomial
    
    
    connum = cond(coeff);               %condition number of V
  
 
    
    %be=coeff1*B;
    pe=coeff*A;             %interpolation
 %plot(w,ye,v,y,'o');               % plot f(x) and mark nodes with 'o'.
%hold on
 %plot(w,pe);
 %hold off
maxerr = norm(ye-pe,Inf) ;          %maximum error
%plot(w,ye-pe);
%grid on;
%plot(w,);
%title('Interpolation error')

end
