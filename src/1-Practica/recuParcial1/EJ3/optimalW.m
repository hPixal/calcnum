function w = optimalW(initialMatrix)  %MUST BE POSITIVE DEFINED AND SYMETRICAL !
  [L D U]=LDUdesc(initialMatrix);
  L;
  D;
  U;
  auxMatrix = -inv(D)*(L+U);
  espectral = max(abs(eig(auxMatrix)));
  w = 2/(1+sqrt(1-espectral^2))
end
