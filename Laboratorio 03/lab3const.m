% Conceptos básicos de modulación pasa-banda
% BASK - BPSK - M-ASK - BFSK
% Se requieren los pkg signal, communications, control
% Carlos A. Medina C. 2021

clc; clear;
pkg load communications
pkg load geometry

up = 100;	% factor de sobremuestreo 
N = 15;	% longitud de los datos 
dt= 1/up;	% intervalo de muestras
T = 1;	% duración de símbolo
fc = 2;	% frecuencia de la portadora

fprintf('Esquemas básicos de modulación digital \n\n');
fprintf('Escoja el tipo de modulación digital de interés \n');
fprintf('BPSK (1) BASK (2) M-ASK (3) BFSK (4)\n\n');
% Modulaciones BPSK, BASK, M-ASK, BFSK
A = input ("Tipo de modulación = ");
if A == 3
  M= input ("Número de niveles para M-ASK = ");
  %p = input('Introduzca la cantidad de puntos formato [0 1 ...] = ');
end

switch (A) 
  case (1)
    d = randint(1,N)*2-1; % Datos binarios polar (+1,-1) BPSK 
  case (2)
    d = randint(1,N);	% Datos binarios (0,+1) BASK 
  case (3)
    d = randint(1,N,M);	% Datos binarios polar (0,+1,...,M-1) M-ASK 
  otherwise
    d = randint(1,N)*2-1; % Datos binarios polar (+1,-1) BFSK 
endswitch

k=[0 N-1];	% Soporte de d, Intantes de muestras kT, k = 0 1 ... N-1
de =repelem(d,up);	% pulsos rectangulares 
tde=k(1):dt:k(2)+1-dt; % Soporte de impulsos 
ni= find(tde == 0);
nf= find(tde == k(2));
de=de(ni:nf);	% datos de interés en instantes k 
tde=tde(ni:nf);	% soporte de datos de interés 
di=upsample(d,up);	% Símbolos (datos) 
di=di(1:length(tde));

switch (A) 
  case (1)
    pc=cos(2*pi*fc*tde);	% portadora 
    drx=de.*pc;	% señal modulada
  case (2)
    pc=cos(2*pi*fc*tde);	% portadora 
    drx=de.*pc;	% señal modulada 
  case (3)
    pc=cos(2*pi*fc*tde);	% portadora 
    drx=de.*pc;	% señal modulada
  otherwise
    pc=cos(2*pi*(fc+1+de).*tde); % portadoras fc = [2 y 4] Hz 
    drx=pc;	% señal modulada
endswitch

v=[min(tde) max(tde) min(drx)-0.5 max(drx)+0.5];
subplot(3,2,1); 
stem(tde,di,'linewidth',2);
axis(v);
grid;
title('Símbolos Tx');

subplot(3,2,3);
plot(tde,de,'linewidth',2,tde,drx,'linewidth',3);
axis(v);
grid;

Fs=1/dt;
subplot(3,2,2);
f=linspace(-Fs/2,Fs/2,length(de));
x=fft(de)/(length(de));
plot(f,fftshift(abs(x)));


hold on 

f=linspace(-Fs/2,Fs/2,length(drx));
x=fft(drx)/(length(drx));
plot(f,fftshift(abs(x)));
grid;
title('Espectro de magnitud de los Símbolos Tx');
axis([-6 6 0 0.5])

switch (A) 
  case (1)
    title('Señal BPSK'); 
  case (2) 
    title('Señal BASK'); 
  case (3)
    title('Señal M-ASK'); 
  otherwise 
    title('Señal BFSK');
endswitch

env=abs(hilbert(drx));	% envolvente 
subplot(3,2,4); 
plot(tde,env,'linewidth',2);
axis(v);
grid;
title('Envolvente de la señal modulada');

%Demodulación 
switch (A)
  case (1)	% demodulación coherente 
    dm=drx.*pc;
    for r = 0:N-2
      dr(r+1)=mean(dm(r*up+1:up*(r+1)));
    end
  case (2)	% detección de envolvente 
    for r = 0:N-2
      dr(r+1)=mean(env(r*up+1:up*(r+1))); 
    end
  case (3)	% detección de envolvente 
    for r = 0:N-2
      dr(r+1)=mean(env(r*up+1:up*(r+1)));
    end
  otherwise	% demodulación no-coherente 
    dm=drx.*cos(2*pi*4*tde); % Usar fc correspondiente al símbolo 1
    for r = 0:N-2 
    dr(r+1)=sum(dm(r*up+1:up*(r+1)));
    end 
endswitch

subplot(3,2,5);
if A == 4 
stem([0:length(dr)-1],dr,'linewidth',2);  
else
stem([0:length(dr)-1],dr,'linewidth',2);  
 endif

axis(v);
grid; 
title('Símbolos recuperados');

switch (A)
case (1)                   %BPSK
M = 2; %Orden de modulacion
s = pskmod([0 1],M,0); %Data modulada
% AWGN para puntos de constellacion
SNR = 100; % SNR en dB 
r = awgn(s,SNR,'measured');
% Diagrama de Constelacion 
subplot(3,2,6)
%h=scatterplot(r); grid minor;
plot(r,'*');axis([-1 1 -1 1]);
%plot(h,'go','MarkerFaceColor',[0,1,0]);
title('Diagrama de Constelacion BPSK')

case (2)                   %BASK
M = 2; %Orden de modulacion
x=[0 1]; %Data modulada
y=[0 0]; %Data modulada
% AWGN para puntos de constellacion
% Diagrama de Constelacion 
subplot(3,2,6)
%h=scatterplot(r); grid minor;
plot(x,y,'*');
%plot(h,'go','MarkerFaceColor',[0,1,0]);
title('Diagrama de Constelacion BASK')

case (3)                   %M-ASK
subplot(3,2,6)
modmap('ask',M);
title('Diagrama de Constelacion M-ASK')

case (4)
M = 2; %Orden de modulacion
x=[-1 1]; %Data modulada
y=[0 0]; %Data modulada
% AWGN para puntos de constellacion
% Diagrama de Constelacion 
subplot(3,2,6)
%h=scatterplot(r); grid minor;
plot(x,y,'*');
%plot(h,'go','MarkerFaceColor',[0,1,0]);
title('Representación BFSK (no tiene diagrama de constelacion)')
endswitch 
