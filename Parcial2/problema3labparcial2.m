Fs=10000;
N=200;
dt=1/Fs;
df=Fs/N;

t=(0:N-1)*dt;
x=cos(100*pi*t)+sin(400*pi*t)-cos(800*pi*t);
h=200*exp(-100*t).*cos(400*pi*t);

subplot(3,2,1);
plot(t,h);
  xlabel ("h");
  ylabel ("t");
  title ("Señal del filtro h(t)");

subplot(3,2,3);
plot(t,x)
  xlabel ("x");
  ylabel ("t");
  title ("Señal de entrada x(t)");

y=conv(x,h)
t1=t(1)+t(1):0.0001:t(end)+t(end);
subplot(3,2,5);
plot(t1,y);
  xlabel ("y");
  ylabel ("t");
  title ("Respuesta al impulso");

subplot(3,2,2);
f=linspace(-Fs/2,Fs/2,length(h));
h=fft(h)/(length(h));
stem(f,fftshift(abs(h)));
axis([-750 750 0 60]);
  xlabel ("h");
  ylabel ("f");
  title ("Espectro de la señal del filtro h(f)");

subplot(3,2,4);
f=linspace(-Fs/2,Fs/2,length(x));
x=fft(x)/(length(x));
stem(f,fftshift(abs(x)));
axis([-600 600 0 0.7]);
  xlabel ("x");
  ylabel ("f");
  title ("Espectro de la señal de entrada x(f)");
  
subplot(3,2,6);
f=linspace(-Fs/2,Fs/2,length(y));
y=fft(y)/(length(y));
stem(f,fftshift(abs(y)));
axis([-500 500 0 2500]); 
  xlabel ("x");
  ylabel ("f");
  title ("Espectro de la espuesta al impulso y(f)");