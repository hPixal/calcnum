#testEj5
clear all; 
clc
# generamos la matriz del ejercicio
b = [1 2 3]'

# A = [ 8 4 1; 2 6 2; 2 4 8]

 A = [5e-2 5.57e2 -4e-2; 1.98 1.94e2 -3e-3; 2.74e2 3.11 7.50e-2];

# A = [1 2 -1; 2 4 0; 0 1 -1];

disp('El nro de condicion de la matriz es:')
NroCond = cond(A) # Calculo el nro de condicion
# Calculo su determinante
disp('El determinante de la matriz es:')
detA = det(A)
A1=A;
b1=b;

disp('=======================================')
disp('Solucion del sistema por Octave')
x1=A1\b1

disp('=======================================')
disp('Solucion del sistema por Gauss')
[xg] = gauss(A1,b1)

disp('=======================================')
disp('Solucion del sistema por Doolitle sin Pivoteo')
[x,L,U] = fact_doolitle(A,b)

disp('=======================================')
disp('Solucion del sistema por Doolitle con Pivoteo')
[x,Ar,L,U,P] = Doolitle_p(A,b)

disp('=======================================')
disp('Solucion del sistema por Gauss con Pivoteo')
[x] = gauss_p(A,b)










