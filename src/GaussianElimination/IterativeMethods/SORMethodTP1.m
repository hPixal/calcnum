function [finalVector,iteration,time,restSOR] = SORMethodTP1(initialMatrix, equalVector, maxIt , tolerance , x0 , relaxation)
  tic();
  iteration = 1;
  myLength = length(initialMatrix);
  myMatrix = [ initialMatrix equalVector ];
  finalVector = x0;
  lastIt = finalVector;

  lastKnownValue(1:myLength,1) = 0;

  while (iteration < maxIt)
    lastIt = finalVector;
    for i = 1 : myLength
      finalVector(i,1) = (1-relaxation)*finalVector(i,1)+ relaxation*(equalVector(i,1) - initialMatrix(i,i+1: myLength)*finalVector(i+1 : myLength,1) - initialMatrix(i,1:i-1)*finalVector(1:i-1,1))/initialMatrix(i,i);
    endfor
    % lo que cambia con Jacobi es que uso datos que voy calculando en la misma iteracion, por lo tanto la convergencia (si es que converge, es más rápida).
    restSOR(iteration+1) = norm(initialMatrix*finalVector - equalVector);

    if restSOR(iteration+1) < tolerance
      break;
    endif

    iteration += 1; % si no alcanzo la tolerancia deseada despues de un numero x de iteraciones corto el algoritmo.
  endwhile
  time = toc();
end
