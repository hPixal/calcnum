clear all; close all; clc;
format long g;

%datos
long = 3;
k0 = 1;
ycd = 21;
H = 5;
uE = 10;
%Ley de enfriamiento de Newton
%-k0u' = H(u - uE)
%condicion robin
%k0u' + Hu = HuE
A = k0;
B = H;
C = H*uE;
rob = [A B C];
inter = [0 long];

%Ecuacion de calor
%-k0*u'' = f(x)
%despejando u'' y reemplazando k0
%u'' = -f(x)

%Ecuacion diferencial lineal f = p y' + q y + r
f = @(x) [zeros(size(x)) zeros(size(x)) -20.*sin(5.*(x-1))];

%Solucion
L=2;
[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
for i=1:100
  L *= 2;
  [x,y1]=dif_fin_rob(f,inter,ycd,rob,L);
  if abs(y1(end) - y(end)) < 1e-3
    y = y1;
    break;
  endif
  y = y1;
endfor
L
y(end)

%Temperatura maxima
[tempmax, i] = max(y);
x(i)
tempmax

%Grafica
plot(x,y);

%Flujo en el extremo derecho
h = long/L;
%formula de dos puntos regresiva para estimar u'
phi1 = -k0*(3*y(end) - 4*y(end-1) + y(end-2))/(2*h)