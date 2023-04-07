function [finalMatrix] = sustAtrasNO_I(initialMatrix)
% proceso de sustitucion hacia atrás vectorizada
myLength = length(initialMatrix)
finalVector = zeros(myLength-1,1); % inicializamos la solucion
equalVector = initialMatrix(:,end);
finalVector(myLength-1) = equalVector(myLength-1)/initialMatrix(myLength-1,myLength-1); % primer calculo con la ultima ecuacion

  for i=myLength-2:-1:1 % ojo importante el -1 de paso porque sino no reconoce
               % que tiene que ir hacia atrás ej: n=50 i = 49:1, interpreta
               % que el paso es 1 entonces el siguiente numero es 50 y
               % deberia ser 48 y no sigue

    finalVector(i) = (equalVector(i) - initialMatrix(i,i+1:myLength-1)*finalVector(i+1:myLength-1))/initialMatrix(i,i);
  endfor % for i
  finalMatrix = [ eye(myLength-1) finalVector]
end
