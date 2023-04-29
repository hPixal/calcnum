%clear all; close all; clc;
function [finalL,finalU]  = LUdescNO_I(initialMatrix)
% Este codigo ejecuta descomposicion LU vectorizada sin indexado y con
% pivoteo.

    myLength = length(initialMatrix);
    finalU = [ initialMatrix ]; %Expando la matriz
    finalL = eye(myLength); %Inicializo L
    epsilon = 1e-9; % epsilon de la maquina

    for i = 1 : myLength-1 % es mlenght menos 1 porque no hace falta hacer nada
                          % en la ultima fila
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Pivoteo

    [valorMaximo,posicion] = max(abs(finalU(i:myLength,myLength)));
    % ^ Esto lo que hace es fijarse cual es el valor maximo abajo del elemento seleccionado de la diagonal
    % y donde esta su posicion. se invoca con el indexVector porque al pivotar iran cambiando de lugar los renglones
    % y indexVector trackea a donde se movio cada uno para que sepa donde leer.

    if valorMaximo<epsilon
      disp('Los posibles pivotes son CERO') % Si el valor máximo es menor al epsilon de la maquina rompemos el algoritmo
                                            % ya no se puede confiar que los cálculos sea precisos.
      break
    endif

    posicion = posicion + i - 1; % Esto convierte posicion a una posicion global posicion daba relativo al vector que le
                                 % pasabamos que tiene distintas medidas segun i (el menos 1 es por la base 1)

    if posicion != i
      finalU([posicion i]) = finalU([i posicion]); % Cambia de lugar i con la posicion, es decir
                                                             % [ M(1) M(2) .. M(pos) .. M(pos2) ] =>
                                                             % [ M(1) M(2) .. M(pos2) .. M(pos) ]
    endif

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Divido los que estan abajo del elemento que agarramos de la diagonal, es
    % decir, hacemos un vector columna con el rango (i+1:myLength,i) y lo
    % dividimos por el elemento de la diagonal initialMatrix(i,i)

    columnVector = finalU(i+1:myLength,i)/finalU(i,i); % <- diagonal
    finalL(i+1:myLength,i)= columnVector;
    rowVector = finalU(i,i+1:myLength);
    finalU(i+1:myLength,i) = 0; %hago los ceros

    % Ahora multiplico ese vector por el vector fila conformado por el rango
    % (i,i+1:myLength+1), osea los elementos que le siguen en fila luego del
    % elemento de la diagonal que estamos tomando. Esto genera una matriz de
    % tamaño (i+1:myLength)x(i+1:myLength+1) que la usaremos para restar.
    % NOTA: el +1 en las filas es porque se amplio la matriz original.

    minusMatrix = columnVector*rowVector % matriz de resta con tamaño
                                         % (i+1:myLength)x(i+1:myLength+1)

    finalU(i+1:myLength,i+1:myLength) -= minusMatrix; % Las dos matrices
                                                             % son del mimsmo
                                                             % tamaño
    endfor
end
