function[maxerr,connum]=interp3(n) %Interpolation using Chebyshev points and Chebyshev polynomials

f = @(x) 1./(1+25*x.^2);



coeff=ones(1001,n+1);
%coeff1=ones(n+1,n+1);


%v=-cos((0:n)./n*pi);
w=-cos(((0:1000)./1000)*pi); 

    %y=f(v);       
    ye=f(w);          %column of values of the function on interpolation points
    
    
    
    
    
    for j=2:n+1
     %   coeff1(:,j)=cos((j-1).*acos(v));
        coeff(:,j)=cos((j-1).*acos(w));
    end
    
    
    % B=coeff1\(y)';                              %column of unknowns                              
    A= coeff\(ye)';             % coeff*A=ycolumn of the coefficients of the polynomial
  
    
    connum = cond(coeff);               %condition number of V
 
    
   % be=coeff*B;
 pe=coeff*A;             %interpolation

 
 
 % plot(w,ye,v,y,'o');              % plot f(x) and mark nodes with 'o'.
%hold on
 %plot(w,pe);
 %hold off

 
 maxerr = norm(ye-pe,2) ;          %maximum error
%plot(w,ye-pe);
%grid on;
%plot(w,);
%title('Interpolation error')

end