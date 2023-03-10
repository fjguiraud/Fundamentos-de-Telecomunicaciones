function [y]=quant(x,n)
a=max(max(x))-min(min(x));
delta= a/(n-1);
z=(x-min(min(x)))/delta;
y=round(z);
end