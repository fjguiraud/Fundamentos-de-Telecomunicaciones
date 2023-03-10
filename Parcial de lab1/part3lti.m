T=1/100;
t=0:T/500:4*T;
s=2*sin(200*pi*t);
figure(1)
subplot(4,1,1)
plot(t,s)
xlabel ("t(s)");
ylabel ("y(t)");
title("Señal de tono");
grid on;

n = awgn(s,20);
subplot(4,1,2)
plot(t,n);
xlabel ("t(s)");
ylabel ("y(t)");
title("Señal de tono + ruido");
grid on;

as=n+(sin(500*pi*t)-2*cos(700*pi*t));
subplot(4,1,3);
plot(t,as);
xlabel ("t(s)");
ylabel ("y(t)");
title("Señal de tono + ruido + señal aditiva");
grid on;
h=2*150*sinc(2*150*t);
subplot(4,1,4)
plot(t,h.*as);

figure(2)
plot(t,h);