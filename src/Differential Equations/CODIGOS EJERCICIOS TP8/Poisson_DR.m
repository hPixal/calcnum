% Ecuacion de Poisson con condiciones Robin
%
% Programa que resuelve la ecuacion de Poisson con condiciones de contorno
% Dirichlet-Robin, usando Diferencias Finitas
%
% -K0*u''(x) = Q(x), 0<x<L
% u(0) = a; K0*u'(L) + H1*u(L) = H2*uE

% paramwetros del problema:
L=1; K0=1; a=2; H1=0; H2=1; uE=0;
Q =@(x) (100*exp(-20*(x-0.3).^2));
%Q=@(x) (100*(x<0.7));

% parametros del meodos de resolucion
N=30;

%% Armado de la matriz
h = L/N;
unos = ones(N+2,1);
diagonales = [-1*unos 2*unos -1*unos];
matriz = spdiags(diagonales, [-1 0 1], N+2, N+2);
matriz(1,[1:2])=[1 0];
matriz(N+2, [N:N+2]) = [-1 2*h*H1/K0 1];

% Armado del lado derecho

x = linspace(0,L,N+1)';
F =[a; h^2/K0*Q(x(2:N+1)); 2*h*H2*uE/K0];

% Resolucion

U = matriz\F;

U(N+2) = []; % otra forma: U = U(1:N+1);
% Otra forma
%
figure(1)
plot(x,U,'*-')
grid on;
grid minor;