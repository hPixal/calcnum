function [final,it] = sustAdelanteNO_IV(initialMatrix,equalVector,it)
    n = length(initialMatrix);
    final = equalVector;

    for i = 1:n
      base = final(i);
       for j = 1 : i-1
         base = base - initialMatrix(i,j)*final(j);
         it++;
       endfor
     final(i) = base/initialMatrix(i,i);
     it++;
    endfor

    
end
