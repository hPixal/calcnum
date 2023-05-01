function finalVector = sustAdelanteNO_I(initialMatrix,equalVector,it)
  myLength = length(initialMatrix);
  finalVector(1:myLength,1) = 0;
  finalVector(1,1) = initialMatrix(1,1) / equalVector(1,1);

  for i = 2 : myLength
    base = initialMatrix(i,i);
    finalVector(i,1) = ( equalVector(i,1) - intialMatrix(i,1:i-1)*finalVector(1,1:i-1) )/base ;
    it++;
  endfor

end
