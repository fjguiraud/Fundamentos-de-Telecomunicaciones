% Conceptos b�sicos de modulaci�n pasa-banda
% M-ASK - M-PSK - M-FSK - M-QAM - DPSK
% Se requieren los pkg signal, communications, control
% Carlos A. Medina C. 2021

clc; clear;
pkg load communications
up = 100;	% factor de sobremuestreo 
N = 15;	% longitud de los datos 
dt= 1/up;	% intervalo de muestras
T = 1;	% duraci�n de s�mbolo
fc = 2;	% frecuencia de la portadora

fprintf('Esquemas b�sicos de modulaci�n digital \n\n');
fprintf('Escoja el tipo de modulaci�n digital de inter�s \n'); 
fprintf('M-ASK (1) M-PSK (2) M-FSK (3) M-QAM (4) DPSK (5)\n\n');
% Modulaciones M-ASK, M-PSK, M-FSK, M-QAM, DPSK
A = input ("Tipo de modulaci�n = ");

if A == 1
 M= input ("N�mero de niveles para M-ASK = "); 
elseif A == 2
 M= input ("N�mero de niveles para M-PSK = "); 
elseif A == 3
 M= input ("N�mero de niveles para M-FSK = "); 
elseif A == 4
  M= input ("N�mero de niveles para M-QAM = "); 
end

switch (A) 
  case (1)
    d = randint(1,N,M);	% Datos binarios polar (0,+1,...,M-1) M-ASK
  case (2)
    d = randint(1,N,M);	% Datos binarios polar (0,+1,...,M-1) M-PSK
  case (3)
    d = randint(1,N,M);	% Datos binarios polar (0,+1,...,M-1) M-FSK
  case (4)
    d = randint(1,N,M);	% Datos binarios polar (0,+1,...,M-1) M-QAM
    d2 = randint(1,N,M);	% Datos binarios polar (0,+1,...,M-1) M-QAM
  otherwise
    d = randint(1,N);	% Datos binarios (0,+1) DPSK
endswitch

k=[0 N-1];	% Soporte de d, Intantes de muestras kT, k = 0 1 ... N-1
de =repelem(d,up);	% pulsos rectangulares

if A == 4
  de2 =repelem(d2,up);	% pulsos rectangulares
endif

tde=k(1):dt:k(2)+1-dt; % Soporte de impulsos 
ni= find(tde == 0);
nf= find(tde == k(2));
de=de(ni:nf);	% datos de inter�s en instantes k
tde=tde(ni:nf);	% soporte de datos de inter�s
if A == 4
  de2 =repelem(d2,up);	% pulsos rectangulares
  de2=de2(ni:nf);	% datos de inter�s en instantes k 
  di2=upsample(d2,up);	% S�mbolos (datos)
  di2=di2(1:length(tde));
endif
di=upsample(d,up);	% S�mbolos (datos)
di=di(1:length(tde)); 

switch (A) 
  case (1)
    pc=cos(2*pi*fc*tde);	% portadora 
    drx=de.*pc;	% se�al modulada
  case (2)
    pc=cos((2*pi*fc.*tde)+((2/M)*pi.*de));	% portadora 
    drx=pc;	% se�al modulada
  case (3)
    pc=cos(2*pi*(fc+((1/(2*T)).*de)).*tde); % portadoras fc = [2 y 4] Hz 
    drx=pc;	% se�al modulada
  case (4)
    pc=de.*cos(2*pi*fc*tde)+de2.*sin(2*pi*fc*tde);	% portadora 
    drx=pc;	% se�al modulada
  otherwise
    pc=cos((2*pi*fc*tde)+((2/2)*pi.*de));	% portadora 
    drx=pc;	% se�al modulada 
endswitch

v=[min(tde) max(tde) min(drx)-0.5 max(drx)+0.5];
subplot(3,2,1); 
stem(tde,di,'linewidth',2);

if A == 4
   hold on
   stem(tde,di2,'linewidth',2);
endif

%axis([min(de) max(de) min(drx)-0.5 max(drx)+0.5]);
grid;
title('S�mbolos Tx');

subplot(3,2,3);
plot(tde,de,'linewidth',2,tde,drx,'linewidth',3);
title('Se�al modulada');
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
title('Espectro de magnitud de los S�mbolos Tx');
axis([-6 6 0 0.5])

% Modulaciones M-ASK, M-PSK, M-FSK, M-QAM, DPSK
switch (A) 
  case (1)
    title('Se�al M-ASK'); 
  case (2) 
    title('Se�al M-PSK'); 
  case (3)
    title('Se�al M-FSK'); 
  case (4)
    title('Se�al M-QAM'); 
  otherwise 
    title('Se�al DPSK');
endswitch

env=abs(hilbert(drx));	% envolvente 
subplot(3,2,4); 
plot(tde,env,'linewidth',2);
axis(v);
grid;
title('Envolvente de la se�al modulada');

%Demodulaci�n 
switch (A)
  case (1)	% detecci�n de envolvente  
        for r = 0:N-2
      dr(r+1)=mean(env(r*up+1:up*(r+1)));
    end
  case (2)	% demodulaci�n coherente
      dm=drx.*cos(2*pi*tde); % Usar fc correspondiente al s�mbolo 1
    for r = 0:N-2 
    dr(r+1)=sum(dm(r*up+1:up*(r+1)));
  end 
  case (3)	% detecci�n de envolvente 
    dm=drx.*cos(2*pi*4*tde); % Usar fc correspondiente al s�mbolo 1
    for r = 0:N-2 
    dr(r+1)=sum(dm(r*up+1:up*(r+1)));
  end 
  case (4)	% detecci�n de envolvente 
    dm=drx.*cos(2*pi*tde);
    for r = 0:N-2 
      dr(r+1)=mean(dm(r*up+1:up*(r+1)));
    end 
    dm=drx.*sin(2*pi*tde);
    for r = 0:N-2 
      dr1(r+1)=mean(dm(r*up+1:up*(r+1)));
    end
   otherwise	% demodulaci�n coherente 
    dm=drx.*pc;
    for r = 0:N-2
      dr(r+1)=mean(dm(r*up+1:up*(r+1)));
    end
endswitch

v=[min(tde) max(tde) min(drx)-0.5 max(drx)+0.5];
subplot(3,2,5); 
stem(tde,di,'linewidth',2);

if A == 4
   hold on
   stem(tde,di2,'linewidth',2);
endif

grid;
title('S�mbolos recuperados');

switch (A)
  
case (1)                   %M-ASK

subplot(3,2,6)
modmap('ask',M); %Funci�n modmap (method,...) esto grafica el diagrama de conteslaci�n para cada m�todo.
title('Diagrama de Constelacion M-ASK')

case (2)                   %M-PSK

subplot(3,2,6)
modmap('psk',M);
title('Diagrama de Constelacion M-PSK')

case (3)                   %M-FSK

subplot(3,2,6)
modmap('fsk',M);
title('Representacion de Constelacion M-FSK')

case (4)                   %QAM

subplot(3,2,6)
modmap('qam',M);
title('Diagrama de Constelacion M-QAM')

case (5) 

M = 2; %Orden de modulacion
s = pskmod([0 1],M,0); %Data modulada
% AWGN para puntos de constellacion
SNR = 100; % SNR en dB 
r = awgn(s,SNR,'measured');
% Diagrama de Constelacion 
subplot(3,2,6);
plot(r,'*');axis([-1 1 -1 1]);
title('Diagrama de Constelacion DPSK');
endswitch 