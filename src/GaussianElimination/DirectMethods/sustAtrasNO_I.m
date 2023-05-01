function [finalMatrix,it] = sustAtrasNO_I(initialMatrix,it)
  myLength = length(initialMatrix);
  finalVector = zeros(myLength-1,1);
  equalVector = initialMatrix(:,end);

  finalVector(myLength-1) = equalVector(myLength-1)/initialMatrix(myLength-1,myLength-1); 

  for i=myLength-2:-1:1
    finalVector(i) = (equalVector(i) - initialMatrix(i,i+1:myLength-1)*finalVector(i+1:myLength-1))/initialMatrix(i,i);
    it++;
  endfor
  finalMatrix = [ eye(myLength-1) finalVector];
end
