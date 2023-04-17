function finalVector = sustAdelante(initialMatrix,equalVector,indexVector)
  myLength = length(initialMatrix);
  finalVector(indextVector(1:myLength,1)) = 0;
  finalVector(indextVector(1,1)) = initialMatrix(indextVector(1,1)) / equalVector(indextVector(1,1));

  for i = 2 : myLength
    base = initialMatrix(indextVector(i,i))
    finalVector(indextVector(i,1)) = ( equalVector(indextVector(i,1)) - intialMatrix(indextVector(i,1:i-1))*finalVector(indextVector(1,1:i-1)) )/base
  endfor
end
