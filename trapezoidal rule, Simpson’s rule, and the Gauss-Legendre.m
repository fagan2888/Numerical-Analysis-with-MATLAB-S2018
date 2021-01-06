allN=[ 2 4 8 16 32 64 128 256 ];
fExact=@(x) (exp(cos(8*pi.*x)));
T=zeros(length(allN),1);
format long
%Trapezoidal Rule
for i=1:length(allN)
    n = allN(i);
    
    
    xError = -1:2/n:1;
    f = fExact(xError);
    
    T(i)=(2/n)*[sum(f)-(1/2)*(f(1)+f(length(xError)))];
end

%Simpson's Rule

S=zeros(length(allN),1);
for i=1:length(allN)
    n = allN(i);
    x=zeros(n+1,1);
    xError = -1:2/n:1;
    f = fExact(xError);
    for j=2:n
        x(1)=1;
        x(n+1)=1;
        if mod(j,2)==0
            x(j)=4;
        else
            x(j)=2;
        end
    end
  L=f*x;
  S(i)=3*n\2*L;
end

%Gauss Quadrature
G=zeros(length(allN),1);
for i=1:length(allN)
    
n = allN(i); 
x=zeros(n,1); w=zeros(n,1);
    
beta =.5./sqrt(1-(2*(1:n-1)).^(-2));
TT=diag(beta,1)+diag(beta,-1);
[V,D]=eig(TT);
x=diag(D); [x,j]=sort(x);
w=2*V(1,j).^2;

g=fExact(x);
G(i)=w*g;
end

for i=1:6
    L1(i)=(T(i+1)-T(i))/(T(i+2)-T(i+1));
    L2(i)=(S(i+1)-S(i))/(S(i+2)-S(i+1));
    L3(i)=(G(i+1)-G(i))/(G(i+2)-G(i+1));
    
end
    