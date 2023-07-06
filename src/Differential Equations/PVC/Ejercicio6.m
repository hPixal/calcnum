clear all; close all; clc;
long = 5;
K0 = 0.9;
%u(0) = 6;
H = 15;
uE = 4;
fuente = @(x) 5.*x.*(5-x);
cR = @(x) 1.05.*x + 2;

%ley de enfriamiento de Newton -K0u'(long)=H(u(long)-uE)
%despejo K0*u'(long)+H*u(long)=H*uE (condicion robin)
%         A*u'(long)+B *u(long)=C
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
f = @(x) [cR(x)./K0 0.*x -fuente(x)./K0];

L = 3;
[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
for i=1:100
  L=L*2;
  [x,y0]=dif_fin_rob(f,inter,ycd,rob,L);
  y0(end);
  if abs(y(end) - y0(end)) < 1e-5
    y=y0;
    break;
  endif
  y=y0;
endfor
y((end+1)/2)
plot(x,y)
%la temperatura en el puntao medio de la barra es de 22.17
