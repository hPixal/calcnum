#Problema1Burden.m (incluye el calculo por diferencias finitas del problema 3)
% metodo del disparo lineal
clear all; clc; clf
format long
f =@(x) [0*x 4 -4.*x];

inter = [0 1];
yc = [0 2];
L=20;

%[xd,yd] = disparo_linealJJ(f,inter,yc,L);
[xd,yd] = disparo_lineal(f,inter,yc,L);

% calculamos la exacta:

xx = linspace(0,1,L+1)
fexacta = @(x) (exp(2)*((exp(4)-1)^(-1))).*(exp(2*x) - exp(-2*x))+x;
fex=fexacta(xx);

%============================================================
% Graficamos todos los calculos y comparamos con la exacta.
figure(1)
% Solucion del metodo del disparo:
plot(xd,yd,'b-*')
hold on
% Solucion de la exacta:
plot(xx,fex,'r-d')


xlabel('valores de x')
ylabel('Solucion de la ecuacion diferencial')
title('Metodo del disparo')
legend('MDisparo','Fexacta')
grid on
grid minor
hold off


%===========================================================
% Calculo del error
ErrorDisparo=abs((fex' - yd));
figure(2)
semilogy(xx,ErrorDisparo,'b-*')
hold on
grid on
grid minor
hold off