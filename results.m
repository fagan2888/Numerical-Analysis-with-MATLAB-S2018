function[] = results() 
a=[4 8 16 32 64 128];
maxerr=[];
connum=[];
for j=1:length(a)
    
   %[maxerr(j),connum(j)]=interp(a(j));   %monomial basis with evenly spaced points
   %[maxerr(j),connum(j)]=interp1(a(j));  %monomial basis with Chebyshev points
    %[maxerr(j),connum(j)]=interp2(a(j)); %Chebyshev polynomials with evenly..
                                        %spaced points
    [maxerr(j),connum(j)]=interp3(a(j));  %Chebyshev polynomials with...
                                        %Chebyshev points
end

figure
subplot(2,2,1);
scatter(maxerr,a)
title('Maximum error vs n')


subplot(2,2,2);
loglog(connum,a)
title('Condition number vs n')







