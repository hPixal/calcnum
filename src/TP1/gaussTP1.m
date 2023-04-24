function [finalVector,iteration,time] = gaussTP1(initialMatrix,equalVector,rest)
  tic();
  myLength=length(equalVector);
  finalVector=equalVector*0;
  iteration = 1;

  for i=1:1:myLength
    base=initialMatrix(i+1:myLength,i)/initialMatrix(i,i);
    initialMatrix(i+1:myLength,i:myLength) = initialMatrix(i+1:myLength,i:myLength) - base*initialMatrix(i,i:myLength);
    equalVector(i+1:myLength) = equalVector(i+1:myLength) - base*equalVector(i);
    iteration = iteration + 1;
  endfor

  [finalVector,iteration,time]=sustAtrasTP1(initialMatrix,equalVector);
  finalVector = finalVector';
  time += toc();
end
