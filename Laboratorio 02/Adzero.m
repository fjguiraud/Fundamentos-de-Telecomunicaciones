Fs=10000;
N=200;
dt=1/Fs;
df=Fs/N;
t=(0:N-1)*dt;
x1=sin(100*2*pi*t);
x2=2*sin(202.5*pi*2*t);
figure(1);
subplot(3,1,1);
plot(t,x1);
hold on;
plot(t,x2);
plot(t,x1+x2);
hold off;

Fs=1000;
N=1000;
dt=1/Fs;
df=Fs/N;
printf("La resolucion de la frecuencia df: %f \n",df)
t=(0:N-1)*dt;
x1=sin(100*2*pi*t);
x2=2*sin(202.5*pi*2*t);

x=x1+x2;
f=linspace(-Fs/2,Fs/2,length(x));
x=fft(x)/(length(x));

subplot(3,1,2);
stem(f,abs(x));

x=x1+x2;
f=linspace(-Fs/2,Fs/2,length(x));
x=fft(x)/(length(x));

subplot(3,1,3);
stem(f,abs(x));
axis([0 300 0 0.7]);


###################
figure(2);
Fs=1000;
N=2000;
dt=1/Fs;
df=Fs/N;
printf("La resolucion de la frecuencia df: %f \n",df)
t=(0:N-1)*dt;
x1=sin(100*2*pi*t);
x2=2*sin(202.5*pi*2*t);
x=x1+x2;
x3=[x zeros(1,length(x))];
f=linspace(-Fs/2,Fs/2,length(x3));
x3=fft(x3)/(length(x3));

subplot(3,1,1);
stem(f,abs(x3));
#axis([0 500 0 1.2]);