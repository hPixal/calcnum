function finalVector = sustDoolittle(initialMatrix , equalVector)
  myLength = legnth(equalVector);
  [L D U ] = LDUdesc(initialMatrix);
  finalVector = sustAtrasNO_I(U,equalVector);
  finalVector = sustAdelanteNO_I(D,finalVector)
  finalVector = sustAdelanteNO_I(L,finalVector);
end
