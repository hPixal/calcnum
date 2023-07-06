% Ecuacion de Poisson con condiciones Dirichlet
%
% Programa que resuelve la ecuacion de Poisson con condiciones de contorno
% Dirichlet, usando Diferencias Finitas
%
% -K0*u''(x) = Q(x), 0<x<L
% u(0) = a; u(L) = b;

% paramwetros del problema:
L=1; K0=1; a=2; b=-3;
Q =@(x) (100*exp(-20*(x-L/3).^2));

% parametros del meodos de resolucion
N=30;

%% Armado de la matriz
h = L/N;
unos = ones(N+1,1);
diagonales = [-1*unos 2*unos -1*unos];
matriz = spdiags(diagonales, [-1 0 1], N+1, N+1);
matriz(1,[1:2])=[1 0];
matriz(N+1, [N:N+1]) = [0 1];

% Armado del lado derecho

x = linspace(0,L,N+1)';
F =[a; h^2/K0*Q(x(2:N)); b];

% Resolucion

U = matriz\F;
figure(1)
plot(x,U,'*-')
grid on;
grid minor;
