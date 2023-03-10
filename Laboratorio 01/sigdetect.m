T = 5;
t=0:T/50:T*3
#x=square(2*t/T);
x1=(t>0 & t<T);
x0=-x1;
n = awgn(x1,8);

subplot(5,1,1)
plot(t,x1)
axis([-1,15,0,1]);

subplot(5,1,2)
plot(t,x1+n)
axis([-1,15,-1,4]);

subplot(5,1,3)
plot(t-0.7,x1+n)
axis([-1,15,-1,4]);

subplot(5,1,4)
y0=conv(x1+n,x1)
t2=linspace(0,t(end)+t(end),length(y0))
plot(t2,y0)
axis([-1,15,-1,100]);

if max(y0>0)
  x2=(t>0 & t<T);
  
else

  endif
subplot(5,1,5)
plot(t,x2) 
axis([-1,15,0,1]);