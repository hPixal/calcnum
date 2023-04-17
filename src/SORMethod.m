clear all; close all; clc;
function [finalVector] = SORMethod(initialMatrix, equalVector, maxIt , tolerance , x0 , relaxation)
  myLength = length(initialMatrix);
  myMatrix = [ initialMatrix equalVector ];
  finalVector = x0;
  count = 1;
  lastIt = finalVector;

  lastKnownValue(1:myLength,1) = 0;

  while (count < maxIt)
    lastIt = finalVector;
    for i = 1 : myLength
      finalVector(i,1) = (1-relaxation)*finalVector(i,1)+ relaxation*(equalVector(i,1) - initialMatrix(i,i+1: myLength)*finalVector(i+1 : myLength,1) - initialMatrix(i,1:i-1)*finalVector(1:i-1,1))/initialMatrix(i,i);
    endfor
    % lo que cambia con Jacobi es que uso datos que voy calculando en la misma iteracion, por lo tanto la convergencia (si es que converge, es más rápida).
    difference = abs( norm(finalVector) - norm(lastIt));
    if (difference < tolerance) % Con esta linea de codigo me fijo si la el absoluto de la diferencia entre normas es menor al limite de tolerancia, si lo es, ya
                                % no es necesario seguir iterando, por ello corto y devuelvo el resultado.
      break;
    endif
    count += 1; % si no alcanzo la tolerancia deseada despues de un numero x de iteraciones corto el algoritmo.
  endwhile
end
