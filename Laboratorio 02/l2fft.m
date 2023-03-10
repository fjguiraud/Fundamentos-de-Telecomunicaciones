to=1/500;
fs=12000;
dt=1/fs;
tt=10*to;
t=0:dt:tt;

x=5*cos(1800*pi*t) + 15*cos(2000*pi*t) + 5*cos(2200*pi*t);
subplot(4,1,1);
plot(t,abs(x));

y=[abs(x),zeros(1,length(x))];
t2=linspace(0,t(end)+t(end),length(y));
subplot(4,1,2);
plot(t2,y);

f=linspace(-fs/2,fs/2,length(x));
x=fft(x)/length(x);
subplot(4,1,3);
plot(f,fftshift(abs(x)));

subplot(4,1,4);
stem(f,fftshift(abs(x)));
axis([-1500 1500]);