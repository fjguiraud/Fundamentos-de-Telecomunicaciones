t = -2:0.01:2;
x = ((2 * (abs(t).^(1.3)))-(3*abs(t)))./((exp(-4*abs(t-1)))+1);
subplot(6,1,1);

plot(t,x)
grid;

x1 = ((2 * (abs(0.7).^(1.3)))-(3*abs(0.7)))./((exp(-4*abs(0.7-1)))+1);
subplot(6,1,2);
plot(0.7,x1)
grid;

subplot(6,1,3);
plot(-t,x)
grid;

subplot(6,1,4);
plot(0.5*t,x)
grid;

subplot(6,1,5);
plot(2*t-1,x)
grid;

xa = ((2 * (abs(0.5*t).^(1.3)))-(3*abs(0.5*t)))./((exp(-4*abs(0.5*t-1)))+1);
xb = 0.5*(x.*xa)
subplot(6,1,6);
plot(t,xb)
grid;

#for i=
#if ()
 # then-body
#endif