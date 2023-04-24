function w = optimalW(initialMatrix)
  [L D U]=LDUdesc(initialMatrix);
  auxMatrix = (-1)*inv(D)*(L+U)
  espectral = max(abs(eig(auxMatrix)))
  w = 2/(1+sqrt(1-espectral^2));
end