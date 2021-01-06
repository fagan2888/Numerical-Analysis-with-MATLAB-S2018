%Error
h=[0.2,0.1,0.05,0.02,0.01,0.005,0.002,0.001];
t(1)=1;

Y=zeros(1,8);
error=zeros(1,8);
for i=1:8
    yapprox=rungekutta(h(i));
    for j=1:ceil(20/h(i))
      t(j+1)=t(j)+h(i);
      yexact(j+1)=1./t(j+1);
    end
    Y(i)=abs(yapprox-yexact);
    error(i)=norm(Y(i),Inf); 
end
