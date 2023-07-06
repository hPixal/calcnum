%Ej5TP8_EX28_7_22.m
% PVC calentamiento de una barra de cobre con una fuente. Difusion-reaccion
% Ley de enfriamiento de Newton
% PVC tipo Robin -K0*u'(L) = H(u(L)-ue);
% -0.9*u'(3)-15*u(3)= -15*4
clear all,clc
Largo=2;                   % Longitud de la barra
y0=6;                      % temperatura extremo izquierdo
Hnewton=15;                % Coeficiente convectivo en la frontera
ue=4;                      % Temperatura exterior
K0=0.57;                   % Conductividad termica (depende del material)
A=0.01;                    % area de la seccion del tubo
rho=2.7;                   % densidad del materialc=0.217,
c=0.217;                   % Calor especifico 
                    
%fuente=@(x) 5*x.*(5-x); 
fuente = @(x) 2*x.*(2-x);   % Fuente de calor "r"
%pR = @(x) (1.05)*x+2; 
pR=@(x) 0.1*x.^3+2.5;     % proceso reactivo

%f =@(x) [0.*x (1/K0)*pR(x) -(1/K0)*fuente(x)];
f =@(x) [(0.*x)/K0  pR(x)/K0 -fuente(x)/K0];
h=0.005;
L = Largo/h;
inter=[0 Largo];
rob=[-0.57 -15 -60];
[xDFR,yDFR] = dif_fin_rob(f,inter,y0,rob,L);

figure(1)
plot(xDFR,yDFR,'b-*');
title('Temperatura a la largo de la barra calculada por DFinitas con h=0.1')
xlabel('posicion: X')
ylabel('Temperatura')
grid on; grid minor


% temperatura en el extremo derecho
TempExtDer=yDFR(end);
disp('Temperatura en el extremo derecho:');
disp(TempExtDer)

Flujo_ExtDer=Hnewton*(yDFR(end)-ue);
disp('Flujo Extremo Derecho:');
disp(Flujo_ExtDer)

% punto 3
Coef=A*c*rho;
Q = Coef*(SimpsonComp(xDFR,yDFR));
disp('Energia Termica:');
disp(Q)