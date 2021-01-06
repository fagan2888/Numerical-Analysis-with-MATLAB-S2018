function[y]=rungekutta(h)

tfinal=20;

y=ones(1,ceil(tfinal/h));
%Initial Conditions
t(1)=1;
y(1)=1;

f=@(t,y) -5*t.*y.^2+5.\t-1.\t.^2;


    for i=1:ceil(tfinal/h)
        t(i+1)=t(i)+h;
        K1=f(t(i) , y(i));
        K2=f(t(i)+0.5*h,y(i)+0.5*h*K1);
        K3=f(t(i)+0.5*h,y(i)+0.5*h*K2);
        K4=f(t(i)+h,y(i)+h*K3);
        y(i+1)=y(i)+h/6*(K1+2*K2+2*K3+K4);
    end 
  
 