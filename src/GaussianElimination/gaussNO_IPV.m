clear all; close all; clc;
function [finalMatrix]  = gaussNO_IPV(initialMatrix,equalVector)
%Este codigo ejecuta eliminacion gaussiana sin pivoteo sin indexado y no vectorizado
%y sin eliminar los errores de redondeo de la maquina (ANDA)
    mLength = length(initialMatrix)
    finalMatrix = [ initialMatrix equalVector ]
    for i = 1 : mLength-1 % es mlenght menos 1 porque no hace falta hacer nada
                          % en la ultima fila

      base = initialMatrix(i,i); % tomo las diagonales que son las que me
                                 % interesan
      for y = i+1 : mLength-1
        multiplier = finalMatrix(i+1,i)/base; % tomo el que este justo debajo
                                               % m*b = A(i,i+1) = 0
        finalMatrix(y,i) = 0; % Ya se que va a ser cero, asi que optimizamos
        % ahora voy a arrancar a restar toda la fila
        for x = i+1 : length(finalMatrix) % mLength + 1 por ampliada
          finalMatrix(y,x) = finalMatrix(y,x) - multiplier * finalMatrix(i,x);
        endfor
       endfor
    endfor
end
