t = 0:0.1:30;
c = complex(-0.1, 0.3)
y = 2*exp(c*t);

subplot(2,2,1)
plot(t,abs(y),"g")
title("Magnitud")
grid("on")

subplot(2,2,2)
plot(t,angle(y),"r")
title("Fase")
grid("on")

subplot(2,2,3)
plot(t,real(y),"b")
title("Real")
grid("on")

subplot(2,2,4)
plot(t,imag(y),"y")
title("Imag")
grid("on")

