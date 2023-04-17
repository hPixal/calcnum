function finalVector = sustDoolittle(finalL, finalU , equalVector)
  myLength = legnth(equalVector);
  finalVector = sustAtrasNO_I(finalU,equalVector);
  finalVector = sustAdelanteNO_I(finalL,finalVector);
end
