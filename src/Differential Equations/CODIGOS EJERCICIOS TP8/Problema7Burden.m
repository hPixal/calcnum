#Problema7Burden.m (incluye el calculo por diferencias finitas del problema 3)
% metodo del disparo lineal pag 678.
clear all; clc; clf
format long
V1=110;
R1=2; R2=4;
f =@(x) [(-2/x) 0*x 0*x];

inter = [R1 R2];
yc = [V1 0];
L=20;

%[xd,yd] = disparo_linealJJ(f,inter,yc,L);
[xd,yd] = disparo_lineal(f,inter,yc,L);

% calculamos la exacta:

xx = linspace(R1,R2,L+1);
fexacta = @(x) (V1*R1./x).*((R2-x)./(R2-R1));
fex=fexacta(xx);

disp('Potencial en r=3:')
u3=yd(3);
disp(u3)
%============================================================
% Graficamos todos los calculos y comparamos con la exacta.
figure(1)
% Solucion del metodo del disparo:
plot(xd,yd,'b-*')
hold on
% Solucion de la exacta:
plot(xx,fex,'r-d')

xlabel('valores de x. Radio')
ylabel('Solucion de la ecuacion diferencial: Potencial')
title('Metodo del disparo')
legend('MDisparo','Fexacta')
grid on
grid minor
hold off


%===========================================================
% Calculo del error
ErrorDisparo=abs((fex' - yd));
figure(2)
plot(xx,ErrorDisparo','b-*')
grid on
grid minor
