function finalMatrix = sustAtrasNO_IV(initialMatrix)
 finalVector = initialMatrix(:,end); %necesario para que x sea columna
 myLength = length(finalVector); %definimos n por ser una variable local
 finalVector(myLength)=initialMatrix(myLength,myLength+1)/initialMatrix(myLength,myLength);
 for i = myLength-1:-1:1
   base = initialMatrix(i,myLength+1);
    for j = i+1:myLength
      base = base - initialMatrix(i,j)*finalVector(j);
    endfor
  finalVector(i) = base/initialMatrix(i,i);
 endfor
 finalMatrix = [ eye(myLength) finalVector ]
end
