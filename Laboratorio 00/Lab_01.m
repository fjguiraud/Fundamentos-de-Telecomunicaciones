
t1 = 0:0.0002:0.02;
sen = 5*sin(100*2*pi*t1);
subplot(3,1,1)
plot(t1,sen,"k")

hold on

t2 = 0:0.0001:0.01;
co = 5*cos(200*2*pi*t2);
plot(t2,co,"r")
legend("5*Sen(100x)","5*Cos(200x)")
title("Original Functions")
xlabel("time")
ylabel("Amplitud")
grid("on")

subplot(3,1,2)
deriv(sen,t1,500);
legend("5*Sen(100x)","Deriv 5*Sen(100x)")
title("Deriv of Sen")
xlabel("time")
ylabel("Amplitud")
grid("on")

subplot(3,1,3)
deriv(co,t2,1000);
legend("5*Cos(200x)","Deriv 5*Cos(200x)")
title("Deriv of Cos")
xlabel("time")
ylabel("Amplitud")
grid("on")