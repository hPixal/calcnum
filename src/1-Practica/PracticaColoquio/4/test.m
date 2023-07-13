clear all; close all; clc;
long = 2;
A = 0.01;
c = 0.217;
p = 2.7;
K0 = 0.57;
uizq = 6; %u(0) = 6 (ycd)

%ley de enfriamiento de Newton -K0u'(long)=H(u(long)-uE)
%despejo K0*u'(long)+H*u(long)=H*uE (condicion robin)
%         A*u'(long)+B *u(long)=C

H = 15;
uE = 4;
fuente = @(x) 2.*x.*(2-x);
cR = @(x) 0.1.*x.^3 + 2.5;

A = K0;
B = H;
C = H*uE;
inter = [0 long];
ycd = 6;
rob = [A B C];
% -K0*u''(x)+cR(x)u(x)=f(x);
% despejo u''
% u'' = (cR(x)/K0)*u(x)-f(x)/K0
%siendo u(0) = 6 y  K0*u'(5)+H*u(5)=H*uE condicion de contorno de robin
f = @(x) [0.*x cR(x)./K0 -fuente(x)./K0];
L = 3;
[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
for i=1:100
  L=L*2;
  [x,y0]=dif_fin_rob(f,inter,ycd,rob,L);
  if abs(y(round(end/2)) - y0(round(end/2))) < 1e-5
    y=y0;
    break;
  endif
  y=y0;
endfor

%TEMPERATURA EN EXTREMO DERECHO
y(end)

%-----b-----%
h = 2/L;
uprima = (y(end-1)-y(end))/h %diferencias divididas de dos puntos
%uprima3p = (-3*f(x0) + 4*f(x0 + h) - f(x0 + 2*h))/(2*h) %dif divididas con tres puntos progresiva(no sirve en esta)
uprima3r = (3*y(end) - 4*y(end-1) + y(end-2))/(2*h) %dif divididas con tres puntos regresiva
flujo = -K0*uprima
flujo2 = -K0*uprima3r

long = 2;
A = 0.01;
EsobreA = c.*p.*y;
P2 = polyfit(x,EsobreA,2);
S = @(x) polyval(P2,x);
Q= A*cuadratura_gauss(S,0,long,L,2)