#Descomposicion LU
clear all; close all; clc;

function [matrixL , matrixU] = descomposicionLUconPivoteo(initialMatrix)
  givenLength = length(initialMatrix);
  matrixL = zeros(givenLength,givenLength);
  matrixU = initialMatrix;

  for i = 1 : givenLength
    columna = matrixU(:,i);                         %
    pos = getNextPivot(columna,i);                          % pivoteo
    matrixU([i pos], :) = matrixU([pos i], :);  %

    base = matrixU(i,i);

    for y = i+1 : givenLength
        multiplier = matrixU(i+1,i)/base;      % tomo el que este justo debajo
        matrixL(i+1,i) = multiplier;           % m*b = A(i,i+1) = 0
        matrixU(y,i) = 0; % Ya se que va a ser cero, asi que optimizamos
        % ahora voy a arrancar a restar toda la fila
        for x = i+1 : givenLength
          matrixU(y,x) = matrixU(y,x) - multiplier * matrixU(i,x);
        endfor
       endfor
  endfor
  matrixU
  matrixL
end
