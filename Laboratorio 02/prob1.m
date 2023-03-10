Fs=10000;
N=200;
dt=1/Fs;
df=Fs/N;

t=(0:N-1)*dt;
x1=0.8*cos(100*2*pi*t);
x2=1.2*sin(200*pi*2*t);
subplot(3,1,1);
plot(t,x1);
hold on 
subplot(3,1,1);
plot(t,x2);
x=x1+x2;
subplot(3,1,1);
hold on
plot(t,x);
hold off

Fs=1000;
N=1000;
dt=1/Fs;
df=Fs/N;
printf("La resolucion de la frecuencia df: %f \n",df)
t=(0:N-1)*dt;
x1=0.8*cos(100*2*pi*t);
x2=1.2*sin(200*pi*2*t);
x=x1+x2;

f=linspace(Fs/2,-Fs/2,length(x));
x=fft(x)/(length(x));

subplot(3,1,2);
stem(f,abs(x));
axis([0 500 0 0.7]);

x=x1+x2;

f=linspace(-Fs/2,Fs/2,length(x));
x=fft(x)/(length(x));

subplot(3,1,3);
stem(f,fftshift(abs(x)));