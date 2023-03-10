T=1/100;
t=0:T/500:4*T;
s=2*sin(200*pi*t);

subplot(3,1,1)
plot(t,s)