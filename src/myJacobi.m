function finalVector = myJacobi(initialMatrix,equalVector, maxIteration, tolerance)
  initialMatrix = [ initialMatrix equalVector ];
  myLength = length(initialMatrix);

  lastKnownValue(1:myLength,1) = 0; % no se que chote hice pero anda
  lastKnownValue(myLength,1) = -1; % no se que chote hice pero anda

  iterationBefore = lastKnownValue(1:myLength-1,1)

  for j = 1 : maxIteration

    iterationBefore = lastKnownValue(1:myLength-1,1);

    for i = 1 : myLength-1
      base = initialMatrix(i,i);

      rowVector(1:myLength) = initialMatrix(i,1:myLength); % me agarro el renglon en la altura i
      rowVector(i) = 0; % como despejo el elemeno i, no esta presente del otro lado del igual

      columnVector = lastKnownValue; % quiero igualar a la sucecion anterior
      columnVector(i,1) = 0; % no tengo el resultado de (i,1) es lo que estoy buscando.

      lastKnownValue(i) = -(rowVector * columnVector)/base % no se que chota hice pero anda y obtengo el valor (i)
    endfor

    %norm(lastKnownValue(1:myLength-1,1))
    %norm(iterationBefore)

    diffLastIT = abs(norm(iterationBefore) - norm(lastKnownValue(1:myLength-1,1))) % resto las normas de los vectores de ambas iteraciones (actual y anterior)
    finalVector = lastKnownValue(1:myLength-1);
      if(abs(diffLastIT) < tolerance)
         break
      endif

  endfor
end
