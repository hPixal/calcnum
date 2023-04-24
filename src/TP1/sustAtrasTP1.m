function [finalVector , iteration , time ] = sustAtrasTP1(initialMatrix , equalVector, iteration , time)
 tic();
  myLength = length(equalVector);
  finalVector(myLength) = equalVector(myLength)/initialMatrix(myLength,myLength);
  iteration = 1;

  for i=myLength-1:-1:1
   finalVector(i)=(equalVector(i)-initialMatrix(i,i+1:myLength)*finalVector'(i+1:myLength))/initialMatrix(i,i);
  iteration = iteration + 1 ;
  endfor
  time = toc();
end
