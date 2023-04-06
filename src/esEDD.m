function ans = esEDD(initMatrix)
  gLength = length(initMatrix);

  ans = 1;
  for i = 1 : gLength
    base = initMatrix(i,i);

    for y = 1 : gLength
      for x = 1 : gLength
        if x != y
          if initMatrix(y,x) > base
            ans = 0;
            break;
          endif
        endif
      endfor
    endfor
  endfor
end


% Matrix(y,x)
