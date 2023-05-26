function [finalMatrix,indexVector,it] = gauss(initialMatrix , initialVector)
  myLength = length(initialMatrix); % tamano original
  finalMatrix = [initialMatrix initialVector]; % ampliacion de la matriz original
  indexVector = 1:myLength; % crea un vector tipo [ 1 2 3 ... myLength ]
  epsilon = 1e-9; % epsilon de la maquina
  P = eye(myLength);
  it = 1;
  for i = 1 : myLength - 1 % -1 porque el ultimo ya estará formato triangular superior

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Pivoteo

    [valorMaximo,posicion] = max(abs(finalMatrix(indexVector(i:myLength),i)));
    % ^ Esto lo que hace es fijarse cual es el valor maximo abajo del elemento seleccionado de la diagonal
    % y donde esta su posicion. se invoca con el indexVector porque al pivotar iran cambiando de lugar los renglones
    % y indexVector trackea a donde se movio cada uno para que sepa donde leer.

    if valorMaximo<epsilon
      disp('Los posibles pivotes son CERO') % Si el valor máximo es menor al epsilon de la maquina rompemos el algoritmo
                                            % ya no se puede confiar que los cálculos sea precisos.
      break
    endif

    posicion = posicion + i - 1; % Esto convierte posicion a una posicion global posicion daba relativo al vector que le
                                 % pasabamos que tiene distintas medidas segun i (el menos 1 es por la base 1)

   if posicion != i
     indexVector(:,[i,posicion]) = indexVector(:,[posicion,i]); % Cambia de lugar i con la posicion, es decir
                                                        % [ M(1) M(2) .. M(pos) .. M(pos2) ] =>
                                                        % [ M(1) M(2) .. M(pos2) .. M(pos) ]
     P([i,posicion],:) = P([posicion,i],:);
   endif

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Divido los que estan abajo del elemento que agarramos de la diagonal, es
    % decir, hacemos un vector columna con el rango (i+1:myLength,i) y lo
    % dividimos por el elemento de la diagonal initialMatrix(i,i)

    columnVector = finalMatrix(indexVector(i+1:myLength),i)/finalMatrix(indexVector(i),i);% <- diagonal
    rowVector = finalMatrix(indexVector(i),i+1:myLength+1);
    finalMatrix(indexVector(i+1:myLength),i) = 0; %hago los ceros

    % Ahora multiplico ese vector por el vector fila conformado por el rango
    % (i,i+1:myLength+1), osea los elementos que le siguen en fila luego del
    % elemento de la diagonal que estamos tomando. Esto genera una matriz de
    % tamaño (i+1:myLength)x(i+1:myLength+1) que la usaremos para restar.
    % NOTA: el +1 en las filas es porque se amplio la matriz original.

    minusMatrix = columnVector*rowVector; % matriz de resta con tamaño
                                         % (i+1:myLength)x(i+1:myLength+1)

    finalMatrix(indexVector(i+1:myLength),i+1:myLength+1) -= minusMatrix; % Las dos matrices
                                                             % son del mimsmo
                                                             % tamaño
    it++;
 endfor
 finalMatrix = sustAtras(finalMatrix,indexVector,it);
 indexVector
end
