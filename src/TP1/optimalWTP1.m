function w = optimalWTP1(initialMatrix)
  [L D U]=LDUdescTP1(initialMatrix);
  L
  D
  U
  auxMatrix = -inv(D)*(L+U)
  espectral = max(abs(eig(auxMatrix)))
  w = 2/(1+sqrt(1-espectral^2));
end
