clc;clear;
#l = input("Ingrese el lado del cubo: ");
#ll = l*l;
#printf ("El area de una cara del cubo es: %d ",ll);
#vv=ll*l;

#r = input("Ingrese el radio de la circunferencia:  ");
#cc = 2*pi*r;
#aa = 2*pi*(r^(2));
#printf("El area de la circunferencia es %5.2f y su perimetro %5.2f \n",cc,aa);

#ll = zeros(1,3);
#for i = 1:3
#  ll(1,i) = input("Ingrese el valor de lado ");
#endfor
#disp(ll)

#ll = linspace(1,3,3)
#vv = ll.^3;
#printf("Los lados de los cubos son %5.2f, %5.2f y %5.2f \n",ll(1),ll(2),ll(3));
#printf("Los volumenes de los cubos son %5.2f, %5.2f y %5.2f \n",vv(1),vv(2),vv(3));
#t = 1:3;
#plot(ll,t)
#hold on 
#plot(vv,t)

m = zeros(5,6);

for i = 1:5
  for j = 1:6
    m(i,j) = randi([0,10]);
  endfor
endfor
disp(m)
disp("--------------RSUM--------------")
disp(sum(m,1))
disp("--------------RMEAN--------------")
disp(mean(m,1))
disp("--------------CMEAN--------------")
disp(mean(m,2))