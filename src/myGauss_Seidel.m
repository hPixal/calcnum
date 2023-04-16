function [finalVector] = myGauss_Seidel(initialMatrix, equalVector, maxIt , tolerance , x0)
  myLength = length(initialMatrix);
  myMatrix = [ initialMatrix equalVector ];
  finalVector = x0;
  count = 1;
  lastIt = finalVector;

  lastKnownValue(1:myLength,1) = 0;

  while (count < maxIt)
    lastIt = finalVector;
    for i = 1 : myLength
      finalVector(i,1) = (equalVector(i,1) - initialMatrix(i,i+1: myLength)*finalVector(i+1 : myLength,1) - initialMatrix(i,1:i-1)*finalVector(1:i-1,1))/initialMatrix(i,i);
    endfor

    difference = abs( norm(finalVector) - norm(lastIt));
    if (difference < tolerance)
      break;
    endif
    count += 1;
  endwhile

end
