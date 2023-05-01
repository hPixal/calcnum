function [finalMatrix,it] = sustAtras(initialMatrix,indexVector,it)

  myLength = length(initialMatrix) -1;
  finalVector = zeros(myLength-1,1); % inicializamos la solucion
  equalVector = initialMatrix(:,end);
  finalVector(myLength) = equalVector(indexVector(myLength))/initialMatrix(indexVector(myLength),myLength); % primer calculo con la ultima ecuacion

  for i=myLength-1:-1:1

      finalVector(i) = (equalVector(indexVector(i)) - initialMatrix(indexVector(i),i+1:myLength)*finalVector(i+1:myLength))/initialMatrix(indexVector(i),i);
      it++;
  endfor

  finalMatrix = [ eye(myLength) finalVector ];

end
