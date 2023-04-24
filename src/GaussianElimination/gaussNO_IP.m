clear all; close all; clc;
function [finalMatrix]  = gaussNO_IP(initialMatrix,equalVector)
% Este codigo ejecuta eliminacion gaussiana vectorizada sin indexado y sin
% pivoteo. No elimina los errores de redondeo de la maquina. FUNCIONA

    myLength = length(initialMatrix)
    finalMatrix = [ initialMatrix equalVector ] %Expando la matriz


    for i = 1 : myLength-1 % es mLength menos 1 porque no hace falta hacer nada
                          % en la ultima fila

    % Divido los que estan abajo del elemento que agarramos de la diagonal, es
    % decir, hacemos un vector columna con el rango (i+1:myLength,i) y lo
    % dividimos por el elemento de la diagonal initialMatrix(i,i)

    columnVector = finalMatrix(i+1:myLength,i)/finalMatrix(i,i);% <- diagonal
    rowVector = finalMatrix(i,i+1:myLength+1);
    finalMatrix(i+1:myLength,i) = 0; %hago los ceros

    % Ahora multiplico ese vector por el vector fila conformado por el rango
    % (i,i+1:myLength+1), osea los elementos que le siguen en fila luego del
    % elemento de la diagonal que estamos tomando. Esto genera una matriz de
    % tamaño (i+1:myLength)x(i+1:myLength+1) que la usaremos para restar.
    % NOTA: el +1 en las filas es porque se amplio la matriz original.

    minusMatrix = columnVector*rowVector % matriz de resta con tamaño
                                         % (i+1:myLength)x(i+1:myLength+1)

    finalMatrix(i+1:myLength,i+1:myLength+1) -= minusMatrix; % Las dos matrices
                                                             % son del mimsmo
                                                             % tamaño
    endfor
end
