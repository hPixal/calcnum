function [finalMatrix] = sustAtras(initialMatrix,indexVector)
% proceso de sustitucion hacia atrás vectorizada
myLength = length(initialMatrix)
finalVector = zeros(myLength-1,1); % inicializamos la solucion
equalVector = initialMatrix(:,end);
finalVector(indexVector(myLength-1)) = equalVector(indexVector(myLength-1))/initialMatrix(indexVector(myLength-1),myLength-1); % primer calculo con la ultima ecuacion

  for i=myLength-2:-1:1 % ojo importante el -1 de paso porque sino no reconoce
               % que tiene que ir hacia atrás ej: n=50 i = 49:1, interpreta
               % que el paso es 1 entonces el siguiente numero es 50 y
               % deberia ser 48 y no sigue

    finalVector(indexVector(i)) = (equalVector(indexVector(i)) - initialMatrix(indexVector(i),i+1:myLength-1)*finalVector(indexVector(i+1:myLength-1)))/initialMatrix(indexVector(i),i);
  endfor % for i
  finalMatrix = [ eye(myLength-1) finalVector]
end
