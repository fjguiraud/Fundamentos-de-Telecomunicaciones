clc;
clear;
Fs=10000;
N=200;
dt=1/Fs;
df=Fs/N;
r=10610.3
c=0.1*10^-6
t=(0:N-1)*dt;
s=2*sin(200*pi*t);
it=sin(500*pi*t)-2*cos(700*pi*t);
h=(1/(r*c))*exp(-t/(r*c));
sn=awgn(s,20);
subplot(4,2,1);
plot(t,h);
  xlabel ("h");
  ylabel ("t");
  title ("Señal del filtro h(t)");
  axis([0 0.01 0 1000]);

subplot(4,2,3);
plot(t,s)
  xlabel ("s");
  ylabel ("t");
  title ("Señal de entrada s(t)");
  axis([0 0.02 -2.5 2.5]);
  
r=sn+it;
#y=conv(x,h)
#t1=t(1)+t(1):0.0001:t(end)+t(end);
subplot(4,2,5);
plot(t,r);
  xlabel ("r(t)");
  ylabel ("t");
  title ("Señal recibida r(t)=(s(t)+n(t))+i(t)");
 
y=conv(r,h)
t1=t(1)+t(1):0.0001:t(end)+t(end);
subplot(4,2,7);
plot(t1,y);
  xlabel ("y");
  ylabel ("t");
  title ("Señal de salida al impulso y(t)");
  axis([0 0.02 -30000 35000]);

subplot(4,2,2);
f=linspace(-Fs/2,Fs/2,length(h));
h=fft(h)/(length(h));
stem(f,fftshift(abs(h)));
#axis([-2000 2000 0 50]); #espectro completo
axis([0 2000 0 50]);
  xlabel ("h");
  ylabel ("f");
  title ("Espectro de la señal del filtro h(f)");

subplot(4,2,4);
f=linspace(-Fs/2,Fs/2,length(s));
s=fft(s)/(length(s));
stem(f,fftshift(abs(s)));
#axis([-200 200 0 1]); #espectro completo
axis([0 200 0 1])
  xlabel ("s");
  ylabel ("f");
  title ("Espectro de la señal de entrada s(f)");
  
subplot(4,2,6);
f=linspace(-Fs/2,Fs/2,length(r));
r=fft(r)/(length(r));
stem(f,fftshift(abs(r)));
#axis([-500 500 0 1.3]); #espectro completo
axis([0 500 0 1.3]);
  xlabel ("r");
  ylabel ("f");
  title ("Espectro de la señal recibida r(f)");
  
subplot(4,2,8);
f=linspace(-Fs/2,Fs/2,length(y));
y=fft(y)/(length(y));
stem(f,fftshift(abs(y)));
#axis([-500 500 0 5000]); #espectro completo
axis([0 500 0 5000]);
  xlabel ("y");
  ylabel ("f");
  title ("Espectro de la espuesta al impulso y(f)");