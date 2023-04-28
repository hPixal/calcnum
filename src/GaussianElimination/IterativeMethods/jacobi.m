function [finalVector,iteration,time,restJacobi] = jacobi(initialMatrix, equalVector, initialVector, maxIt, tolerance)
  tic();

  myLength=length(equalVector);
  finalVector = initialVector;
  iteration = 1;

  while(iteration <= maxIt)

   for i=1:myLength
     finalVector(i)=(equalVector(i)-initialMatrix(i,1:i-1)*initialVector(1:i-1)-initialMatrix(i,i+1:myLength)*initialVector(i+1:myLength))/initialMatrix(i,i);
   endfor

    restJacobi(iteration+1) = norm(initialMatrix*finalVector - equalVector);

    if restJacobi(iteration+1) < tolerance
      break;
    endif

    initialVector = finalVector;
    iteration = iteration + 1;

  endwhile

  time=toc();
end

