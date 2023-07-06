% Poisson1DDobleNeumann.m
% 
% Programita para resolver la ecuacion de Poisson
% con condiciones de Neumann en x=0 y Neumann en x=L.
% Metodo: Diferencias finitas
%
%  - k u''(x) = f(x),   0 < x < L
%  k u'(0) + H1 u(0) = H2 uE,    k u'(L) + H1 u(L) = H2 uE

%% Parametros del problema
L = 1;  k = 1;  a = 2;
H1 = 20;  H2 = 1;  uE = 0;
%f = @(x)(100*exp(-20*(x-.3).^2));
f = @(x) 100*x;
% f = @(x)( 100*(x>0.7) );

%% Parametros del metodo de resolucion
N = 30;

%% Armado de la matriz
h = L/N;
unos = ones(N+2,1);
diagonales = [-1*unos 2*unos -1*unos];
matriz = spdiags(diagonales, [-1 0 1], N+2, N+2)
%matriz(1,[1:2]) = [1 0];
matriz(N+2, N:N+2) = [-1 2*h*H1/k 1]
matriz(1, 1:3) = [-1 2*h*H1/k 1]
size(matriz)
%% Armado del lado derecho
X = linspace(0,L,N+1)';
F = [ 2*h*H2*uE/k ; h^2/k*f(X(2:N+1)) ; 2*h*H2*uE/k]
size(F)
%% Resolucion
% Resolvemos
U = matriz\F
% Ahora eliminamos el valor del punto ficticio N+2
U(N+2) = []; % otra forma: U = U(1:N+1);
figure(1); plot(X,U,'m-')