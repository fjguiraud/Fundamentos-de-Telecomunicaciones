t1=0:0.0001:0.1;
t2=0:0.00001:0.2;
t3=0:0.0001:0.1
s=sin(400*pi*t1);
h=200*exp(-100*t2).*cos(400*pi*t2);
x=(cos(100*pi*t3)+sin(400*pi*t3)-cos(800*pi*t3));

figure 1
subplot(4,1,1);
plot(t1,s)
  xlabel ("x");
  ylabel ("t");
  title ("sin(400*pi*t)");
  
subplot(4,1,2);
plot(t2,h)
  xlabel ("x");
  ylabel ("t");
  title ("x(t)=200*exp(-100*t)*cos(400*pi*t)");

subplot(4,1,3);
plot(t3,x)
  xlabel ("x");
  ylabel ("t");
  title ("h(t)=cos(100*pi*t)+sin(400*pi*t)-cos(800*pi*t)");
  
subplot(4,1,4);

h=200*exp(-100*t3).*cos(400*pi*t3);
x=(cos(100*pi*t3)+sin(400*pi*t3)-cos(800*pi*t3));
z=conv(x,h)
#t4=linspace(0,t3(end)+t3(end),length(z))
t4=t3(1)+t3(1):0.0001:t3(end)+t3(end)
plot(t4,z)
  xlabel ("x");
  ylabel ("t");
  title ("h(t)*x(t)");