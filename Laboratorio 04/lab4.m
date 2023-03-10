fm = 400; %frecuencia maxima


################### Fs = 20 * fm
Fs = 20*fm; #frecuencia de muestreo
T = 0.2;#tiempo total de la señal
dt = 1/Fs; #periodo de muestreo
N = T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
subplot(5,2,1)
plot(t,m);
grid;
title('Señal muestreada a Fs = 20*fm');
axis([0 0.06]);

subplot(5,2,2)
f=linspace(-Fs/2,Fs/2,length(m));
x=fft(m)/(length(m));
plot(f,fftshift(abs(x)));
grid;
title("Espectro de Magnitud");
axis([-500 500]);

################### Fs = 4 * fm

Fs = 4*fm; #frecuencia de muestreo
T = 0.2; #tiempo total de la señal
dt = 1/Fs; #periodo de muestreo
printf("Periodo de muestreo Ts1: %f \n",dt)
N = T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
subplot(5,2,3);
stem(t,m);
axis([0 0.06]);

hold on 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
plot(t,m);
axis([0 0.06]);
grid;
title('Fs = 4*fm');

subplot(5,2,4)
f=linspace(-Fs/2,Fs/2,length(m));
x=fft(m)/(length(m));
plot(f,fftshift(abs(x)));
axis([-500 500]);

################### Fs = 2.5 * fm

Fs = 2.5*fm; #frecuencia de muestreo
T = 0.2; #tiempo total de la señal
dt = 1/Fs; #periodo de muestreo
printf("Periodo de muestreo Ts1: %f \n",dt)
N = T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
subplot(5,2,5);
stem(t,m);
axis([0 0.06]);

hold on 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
plot(t,m);
axis([0 0.06]);
grid;
title('Fs = 2.5*fm');

subplot(5,2,6)
f=linspace(-Fs/2,Fs/2,length(m));
x=fft(m)/(length(m));
plot(f,fftshift(abs(x)));
axis([-500 500]);

################### Fs = 2 * fm

Fs = 2.05*fm; #frecuencia de muestreo
T = 0.2; #tiempo total de la señal
dt = 1/Fs; #periodo de muestreo
printf("Periodo de muestreo Ts1: %f \n",dt)
N = T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
subplot(5,2,7);
stem(t,m);
axis([0 0.06]);

hold on 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
plot(t,m);
axis([0 0.06]);
grid;
title('Fs = 2*fm');

subplot(5,2,8)
f=linspace(-Fs/2,Fs/2,length(m));
x=fft(m)/(length(m));
plot(f,fftshift(abs(x)));
axis([-500 500]);

################### Fs = 1.25 * fm

Fs = 1.25*fm; #frecuencia de muestreo
T = 0.2; #tiempo total de la señal
dt = 1/Fs; #periodo de muestreo
printf("Periodo de muestreo Ts1: %f \n",dt)
N = T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
subplot(5,2,9);
stem(t,m);
axis([0 0.06]);

hold on 

m=-3+2*cos(300*pi*t)+4*cos(500*pi*t)+6*(1+cos(800*pi*t));
plot(t,m);
axis([0 0.06]);
grid;
title('Fs = 1.25*fm');

subplot(5,2,10)
f=linspace(-Fs/2,Fs/2,length(m));
x=fft(m)/(length(m));
plot(f,fftshift(abs(x)));
axis([-500 500]);