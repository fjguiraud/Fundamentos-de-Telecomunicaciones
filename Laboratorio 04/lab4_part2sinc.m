fm = 400
fs = 2.5*fm; #frecuencia de muestreo
T = 0.2; #tiempo total de la señal
dt = 1/fs; #periodo de muestreo
N = T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia
m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));

subplot(4,2,1);
stem(t,m);
axis([0 0.06]);

hold on 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
plot(t,m);
axis([0 0.06]);
grid;
title('Fs = 2.5*fm');

subplot(4,2,2)
f=linspace(-fs/2,fs/2,length(m));
x=fft(m)/(length(m));
plot(f,fftshift(abs(x)));
axis([-500 500]);

####################### sinc(t)
%Recostruccion de la señal
n1=0:length(m)-1;
x1rsinc=m*sinc(fs*(ones(length(n1),1)*t-(n1/fs)'*ones(1,length(t))));

%Grafica 
subplot(4,2,3);
v=[0 0.06]
plot(t,x1rsinc);axis(v);title('Señal Recostruccion');grid;
####################### stairs(t)


####################### spline(t)


