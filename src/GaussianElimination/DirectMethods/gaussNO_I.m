function [finalMatrix,it,t]  = gaussNO_I(initialMatrix,equalVector)
% Este codigo ejecuta eliminacion gaussiana vectorizada sin indexado y sin
% pivoteo. No elimina los errores de redondeo de la maquina. FUNCIONA
    tic();
    it = 1;
    myLength = length(initialMatrix);
    finalMatrix = [ initialMatrix equalVector ]; %Expando la matriz
    epsilon = 1e-9; % epsilon de la maquina

    for i = 1 : myLength-1 % es mLength menos 1 porque no hace falta hacer nada
                          % en la ultima fila
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Pivoteo

    [valorMaximo,posicion] = max(abs(finalMatrix(i:myLength,myLength)));
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
      finalMatrix([i,posicion],:) = finalMatrix([posicion,i],:); % Cambia de lugar i con la posicion, es decir
                                                                 % [ M(1) M(2) .. M(pos) .. M(pos2) ] =>
                                                                 % [ M(1) M(2) .. M(pos2) .. M(pos) ]
    endif

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Divido los que estan abajo del elemento que agarramos de la diagonal, es
    % decir, hacemos un vector columna con el rango (i+1:myLength,i) y lo
    % dividimos por el elemento de la diagonal initialMatrix(i,i)

    columnVector = finalMatrix(i+1:myLength,i)/finalMatrix(i,i);% <- diagonal
    rowVector = finalMatrix(i,i+1:myLength+1);
    finalMatrix(i+1:myLength,i) = 0; %hago los ceros

    % Ahora multiplico ese vector por el vector fila conformado por el rango
    % (i,i+1:myLength+1), osea los elementos que le siguen en fila luego del
    % elemento de la diagonal que estamos tomando. Esto genera una matriz de
    % tamaño (i+1:myLength)x(i+1:myLength+1) que la usaremos para restar.
    % NOTA: el +1 en las filas es porque se amplio la matriz original.

    minusMatrix = columnVector*rowVector; % matriz de resta con tamaño
                                         % (i+1:myLength)x(i+1:myLength+1)

    finalMatrix(i+1:myLength,i+1:myLength+1) -= minusMatrix; % Las dos matrices
                                                             % son del mimsmo
                                                             % tamaño
    it++;
    endfor
    
    [finalMatrix,it] = sustAtrasNO_I(finalMatrix,it);
    t = toc();
end
