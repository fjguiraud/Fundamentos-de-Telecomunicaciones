T = 2*pi;
t = -4*pi:T/500:4*pi;
y = 2*square(2*pi*t,20);
figure(1)

plot(t,y);
axis([-4*pi 4*pi -2.5 2.5]);
xlabel ("t(s)");
ylabel ("y(t)");
title("2*square(2*pi,20)");
grid on;

T = 2;
t=-8:T/500:8;
y = sinc(t/T);

figure(2)
plot(t,y);
axis([-8 8 -0.5 1]);
xlabel ("t(s)");
ylabel ("y(t)");
title("sinc(t/2)");
grid on;

T = 2;
t=-4:T/500:8;
w = 4;
y = 2*rectpuls(t,w);

figure(3)
plot(t-1,y);
axis([-4 8 -0.5 2.5]);
xlabel ("t(s)");
ylabel ("y(t)");
title("2rect((t-1)/4)");
grid on;


T = (1/100);
t=0:T/500:3*T;
y = 3*sin(400*pi*t)+ i*4*sin((200*pi)*t+5);

figure(4)
 g1 = tf([3769.91],[1,1.5792*10^6]);
 g2 = tf([3.8357,3.8357*185.865],[1,394784]);
 g=g1-g2;
 bode(g);


