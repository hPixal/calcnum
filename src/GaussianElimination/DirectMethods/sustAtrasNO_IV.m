function [finalMatrix,it] = sustAtrasNO_IV(initialMatrix,it)
 finalVector = initialMatrix(:,end); 
 myLength = length(finalVector); 

 finalVector(myLength)=initialMatrix(myLength,myLength+1)/initialMatrix(myLength,myLength);
 
 for i = myLength-1:-1:1
   base = initialMatrix(i,myLength+1);
    for j = i+1:myLength
      base = base - initialMatrix(i,j)*finalVector(j);
      it++;
    endfor
  finalVector(i) = base/initialMatrix(i,i);
  it++;
 endfor
 finalMatrix = [ eye(myLength) finalVector ];
end
