fm = 100;
T = 2/50;
Fs = 1000; #frecuencia de muestreo
dt = 1/Fs; #periodo de muestreo
N = 2*T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia

pkg load communications
pkg load tablicious

fprintf('La potencia promedio de la señal \n'); 
fprintf('m(t) = 5*cos(100*pi*t) + 3*cos(200*pi*t) es igual a: \n');
fprintf('17 W \n');

subplot(4,2,1)
m=5*cos(100*pi*t)+3*cos(200*pi*t);
plot(t,m)
axis([0 2/50])
title('Señal Original');

subplot(4,2,2);

f=linspace(-Fs/2,Fs/2,length(m));
x=fft(m)/(length(m));
stem(f,fftshift(abs(x)));
axis([-350 350])
title('Espectro de la señal original');

########### Grafica original superpuesta
fm = 100;
T = 2/50;
Fs = 1000; #frecuencia de muestreo
dt = 1/Fs; #periodo de muestreo
N = 2*T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia

subplot(4,2,3)
m=5*cos(100*pi*t)+3*cos(200*pi*t);
plot(t,m,"--")
hold on 
#############################

Fs = 1.5*(2*fm); #frecuencia de muestreo
dt = 1/Fs; #periodo de muestreo
N = 2*T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia
m=5*cos(100*pi*t)+3*cos(200*pi*t);

stem(t,m)
axis([0 2/50])

subplot(4,2,4)

f=linspace(-Fs/2,Fs/2,length(m));
x=fft(m)/(length(m));
stem(f,fftshift(abs(x)));
axis([-350 350])

subplot(4,2,5)
fm = 100;
T = 2/50;
Fs = 1000; #frecuencia de muestreo
dt = 1/Fs; #periodo de muestreo
N = 2*T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia

m=5*cos(100*pi*t)+3*cos(200*pi*t);
plot(t,m,"--")

hold on 

Fs = 1.5*(2*fm); #frecuencia de muestreo
dt = 1/Fs; #periodo de muestreo
N = 2*T/dt; #numero de muestras
t = (0:N-1)*dt; #vector tiempo, max(t) = T – dt
df = 1/T; #resolución de frecuencia
m=5*cos(100*pi*t)+3*cos(200*pi*t);

y = quant(m,8);

stem(t,y)
axis([0 2/50]);

c=1;
bindat = dec2bin(reshape(y,24,1));
bindat1 = bindat(1:12,:);
bindat2 = bindat(13:24,:);
opskdat1 = reshape(bindat1,18,2);
opskdat2 = reshape(bindat2,18,2);
count = zeros(24,1);
zerbin = [opskdat1(3,:);opskdat1(3,:);opskdat1(3,:);opskdat1(3,:);opskdat1(3,:);opskdat1(3,:)]
opskdat1 = [opskdat1;zerbin]
opskdat2 = [opskdat2;zerbin]
for i =1:24
  count(i,1)=i;
endfor


up=1/dt;
fc = 2;	% frecuencia de la portadora

k=[0 N-1];	% Soporte de d, Intantes de muestras kT, k = 0 1 ... N-1

de =repelem(y,up);	% pulsos rectangulares

tde=k(1):dt:k(2)+1-dt; % Soporte de impulsos 
ni= find(tde == 0);
nf= find(tde == k(2));
de=de(ni:nf);	% datos de interés en instantes k
tde=tde(ni:nf);	% soporte de datos de interés

di=upsample(y,up);	% Símbolos (datos)
di=di(1:length(tde)); 

pc=cos(2*pi*fc*tde+de);	% portadora 
drx=pc;	% señal modulada

subplot(4,2,6)

hold on

plot(tde,de,'linewidth',2);
title('Señal modulada');
grid;

###############################
phasedat1 = zeros(24,1)
phasedat2 = zeros(24,1)

pulsdat1 = zeros(24,1)
pulsdat2 = zeros(24,1)

for i = 1:24
  if opskdat1(i,:)=="00"
    phasedat1(i,1)=pi/4;
    pulsdat1(i,1)=0;
  elseif opskdat1(i,:)=="01"
    phasedat1(i,1)=(3*pi)/4;
    pulsdat1(i,1)=1;
  elseif opskdat1(i,:)=="10"
    phasedat1(i,1)=(5*pi)/4;
    pulsdat1(i,1)=2;
  elseif opskdat1(i,:)=="11"
    phasedat1(i,1)=(7*pi/4);
    pulsdat1(i,1)=3;
  endif


  if opskdat2(i,:)=="00"
    phasedat2(i,1)=pi/4;
    pulsdat2(i,1)=0;
  elseif opskdat2(i,:)=="01"
    phasedat2(i,1)=(3*pi)/4;
    pulsdat2(i,1)=1;
  elseif opskdat2(i,:)=="10"
    phasedat2(i,1)=(5*pi)/4;
    pulsdat2(i,1)=2;
  elseif opskdat2(i,:)=="11"
    phasedat2(i,1)=(7*pi/4);
    pulsdat2(i,1)=3;
endif
endfor


Table = {'Numero_de_muestra','Valor_quantizado','Nivel_del_quantizador','Codigo_PCM','Simbolos_QPSK_a1','Simbolos_QPSK_a2','Phase_a1','Phase_a2'};
Numero_de_muestra = count;
Valor_quantizado = reshape(m,24,1);
Nivel_del_quantizador = reshape(y,24,1);
Codigo_PCM = dec2bin(reshape(y,24,1));
Simbolos_QPSK_a1 = opskdat1(1:24,:);
Simbolos_QPSK_a2 = opskdat2(1:24,:);
Phase_a1 = phasedat1
Phase_a2 = phasedat2
tab = table (Numero_de_muestra, Valor_quantizado,Nivel_del_quantizador,Codigo_PCM,Simbolos_QPSK_a1,Simbolos_QPSK_a2,Phase_a1,Phase_a2);
prettyprint (tab)

k=[0 N-1];	% Soporte de d, Intantes de muestras kT, k = 0 1 ... N-1
de = repelem(pulsdat1,up);	% pulsos rectangulares
de2 = repelem(pulsdat2,up);	% pulsos rectangulares


tde=k(1):dt:k(2)+1-dt; % Soporte de impulsos 
ni= find(tde == 0);
nf= find(tde == k(2));
de=de(ni:nf);	% datos de interés en instantes k
tde=tde(ni:nf);	% soporte de datos de interés

  de2 =repelem(pulsdat2,up);	% pulsos rectangulares
  de2=de2(ni:nf);	% datos de interés en instantes k 
  di2=upsample(pulsdat2,up);	% Símbolos (datos)
  di2=di2(1:length(tde));

di=upsample(pulsdat1,up);	% Símbolos (datos)
di=di(1:length(tde)); 

v=[min(tde) max(tde) min(drx)-0.5 max(drx)+0.5];
subplot(4,2,7); 
stem(tde,di,'linewidth',2);


hold on
   stem(tde,di2,'linewidth',2);

%axis([min(de) max(de) min(drx)-0.5 max(drx)+0.5]);
grid;
title('Símbolos Tx');
subplot(4,2,8)
plot(tde,de,'linewidth',2,tde,drx,'linewidth',3);
title('Señal modulada');
axis(v);
grid;