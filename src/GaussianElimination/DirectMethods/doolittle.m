function [finalVector,it,t] = doolittle(initialMatrix , equalVector)
  tic();
  n = length(equalVector);
  it = 1;
  [L U it t] = LUfactorizationNO_IPV(initialMatrix);

  [finalVector1,it] = sustAdelanteNO_I(L,equalVector,it);
  [finalVector,it] = sustAtrasNO_I([U finalVector1],it)
  t += toc();
end
