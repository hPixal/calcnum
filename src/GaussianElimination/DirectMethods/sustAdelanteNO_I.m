function [finalVector,it] = sustAdelanteNO_I(initialMatrix,equalVector,it)
  myLength = length(initialMatrix);
  finalVector = equalVector;

  for i = 1 : myLength
    base = initialMatrix(i,i);
    finalVector(i) = ( equalVector(i,1) - initialMatrix(i,1:i-1)*finalVector(1:i-1,1) )/base ;
    it++;
  endfor

end
