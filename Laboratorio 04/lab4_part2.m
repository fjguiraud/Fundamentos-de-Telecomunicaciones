fm = 400

Fs = 2.5*fm; #frecuencia de muestreo
T = 0.2; #tiempo total de la señal
dt = 1/Fs; #periodo de muestreo
N = T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
subplot(4,2,1);
#stem(t,m);
#axis([0 0.06]);

hold on 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
plot(t,m);
axis([0 0.06]);
grid;
title('Fs = 2.5*fm');

subplot(4,2,2)
f=linspace(-Fs/2,Fs/2,length(m));
x=fft(m)/(length(m));
plot(f,fftshift(abs(x)));
axis([-500 500]);

####################### sinc(t)
fs1 = 20*fm;
xs = m(1:fs1/Fs:end);
n1 = 0:length(xs)-1;
#x1rsinc = xs * sinc(Fs*(ones(length(n1),1)*t-(n1/Fs)'*ones(1,length(t))));
#v = [0 t(end)]

subplot(4,2,3);
plot(t,x1rsinc);
#axis([0 0.02])
subplot(4,2,4);
f=linspace(-Fs/2,Fste/2,length(y));
y=fft(y)/(length(y));
plot(f,fftshift(abs(y)));
axis([0 310]);

####################### stairs(t)



####################### spline(t)


