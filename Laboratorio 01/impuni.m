function [t,x]= impuni (d,t1,e,t2)
t =t1:e:t2;
x =(t==d);
stem(t,x)
grid;
endfunction