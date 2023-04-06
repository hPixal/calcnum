function finalVector = sust_atras1(finalMatrix)
  finalVector = finalMatrix(:,end); %necesario para que finalVector sea columna
  myLength = length(finalVector); %definimos n por ser una variable local
  finalVector(n) = finalMatrix(myLength,myLength+1)/finalMatrix(myLength,myLength);

  for j = myLength-1:-1:1
    aux = finalMatrix(j,myLength+1); %equalVector(j)

     for i = j+1:myLength
       finalVector(j) = aux - finalMatrix(j,i)*finalVector(i);
     endfor
   finalVector(j) = finalVector(j)/finalMatrix(j,j);
 endfor
end
