t = 0:0.001:5;
y1 = t.^exp(1);
y2 = exp(t);

figure(1)
plot(t,y1,"k")

hold on

plot(t,y2,"r")

title("Comparison")
legend("t^exp(1)", "exp(t)")

figure(2)

plot(t,y1 - y2,"b")
title("Difference")
t2 = 0:0.01:5;
t = 0;
for i = 1:size(t2,2)
 if((y1 - y2 <= 0.001)&&(y1 - y2 >= -0.001))   
   disp(t)
 endif
 t = t + 0.01;
endfor