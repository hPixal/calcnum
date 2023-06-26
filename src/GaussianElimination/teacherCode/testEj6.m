#testEj6
clear all; 
clc
# generamos la matriz del ejercicio

 A1 = [ 1 -2 3 0; 3 -6 9 3; 2 1 4 1; 1 -2 2 -2]


disp('El nro de condicion de la matriz es:')
NroCond = cond(A1) # Calculo el nro de condicion
# Calculo su determinante
disp('El determinante de la matriz es:')
detA1 = det(A1)

% Doolittle con Pivoteo parcial 

disp('=======================================')
disp('Calculo de las matrices pedidas con pivoteo')
[A,L,U,P,Z,Z1] = Doolitle_p(A1)


disp('=======================================')
disp('comprobamos que se cumple la igualdad')
disp('Z=P*A1 :')
disp(Z)
disp('Z1=L*U :')
disp(Z1)