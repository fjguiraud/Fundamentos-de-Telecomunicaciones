T=0.1;
N=1000;
dt=1*10^-3;
Fs=1/dt;
t=(0:N-1)*dt;
p1=2*cos(2*pi*50*t);
p2=2*sin(2*pi*50*t);

n=5*sin(1*pi*10*t)+10*cos(2*pi*15*t);

T = 0.2;
m = -5*square(2*pi*5*t)+5;
pm=2500;
disp("El contenido de potencia de la señal m(t)=")
disp(pm)
pn=1;
disp("El contenido de potencia de la señal n(t)=")
disp(pn)
pp=4;
disp("El contenido de potenciade las señales moduladoras es=")
disp(pp)

subplot(4,2,1);
plot(t,m);
axis([0 0.5 -2 12]);
  xlabel ("m");
  ylabel ("t");
  title ("Señal m(t)");

subplot(4,2,3);
plot(t,n);
axis([0 0.5 -15 15]);
  xlabel ("n");
  ylabel ("t");
  title ("Señal n(t)");

subplot(4,2,5);
plot(t,p1);
hold on
plot(t,p2);
axis([0 0.2 -2 2]);
  xlabel ("p1 y p2");
  ylabel ("t");
  title ("Señales portadoras QAM (cos y sin)");

y=m.*p1+n.*p2;
subplot(4,2,7);
plot(t,y);
  xlabel ("y");
  ylabel ("t");
  title ("Señal y(t)");

subplot(4,2,2);
f=linspace(-Fs/2,Fs/2,length(m));
m=fft(m)/(length(m));
stem(f,fftshift(abs(m)));
axis([-80 80 0 5]); #espectro completo
  xlabel ("m");
  ylabel ("f");
  title ("Espectro de la señal m");

subplot(4,2,4);
f=linspace(-Fs/2,Fs/2,length(n));
n=fft(n)/(length(n));
stem(f,fftshift(abs(n)));
axis([-80 80 0 5]); #espectro completo
  xlabel ("n");
  ylabel ("f");
  title ("Espectro de la señal n");
  
p=p1+p2;
subplot(4,2,6);
f=linspace(-Fs/2,Fs/2,length(p1+p2));
p=fft(p)/(length(p));
stem(f,fftshift(abs(p)));
axis([-80 80 0 2]); #espectro completo
  xlabel ("p1+p2");
  ylabel ("f");
  title ("Espectro de las portadoras p");
  
subplot(4,2,8);
f=linspace(-Fs/2,Fs/2,length(y));
y=fft(y)/(length(y));
stem(f,fftshift(abs(y)));
axis([-80 80 0 6]); #espectro completo
  xlabel ("y");
  ylabel ("f");
  title ("Espectro de señal modulada");

