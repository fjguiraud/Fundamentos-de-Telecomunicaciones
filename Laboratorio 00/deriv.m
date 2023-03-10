function [x,tx] = deriv (y,ty,e)

plot(ty,y,"g")
hold on
x = diff(y)./diff(ty);
x = x./e;
tx = ty(2:end);


plot(tx,x,"b")


endfunction