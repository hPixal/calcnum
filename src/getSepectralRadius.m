function result = getSepectralRadius(initMatrix)
  result = max(abs(eig(initMatrix)));
end
