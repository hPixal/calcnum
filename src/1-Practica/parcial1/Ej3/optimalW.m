function w = optimalW(initialMatrix)  %MUST BE POSITIVE DEFINED AND SYMETRICAL !
  [L D U]=LDUdesc(initialMatrix); 
  auxMatrix = -inv(D)*(L+U)
  espectral = max(abs(eig(auxMatrix)))
  w = 2/(1+sqrt(1-espectral^2));
end
