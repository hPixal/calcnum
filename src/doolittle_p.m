clear all; close all; clc;

%En este algoritmo voy a hacer descomposicion LU con pivoteo mediante el algori
%tmo de Doolittle

function [finalL , finalU ] = doolittle_p(initialMatrix)
  myLength = length(initialMatrix); % tamano original
  finalU = initialMatrix ; % ampliacion de la matriz original
  finalL = eye(myLength) ; % matriz identidad
  indexVector = 1:myLength; % crea un vector tipo [ 1 2 3 ... myLength ]
  epsilon = 1e-9; % epsilon de la maquina


  for i = 1 : myLength - 1 % -1 porque el ultimo ya estará formato triangular superior

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Pivoteo

    [valorMaximo,posicion] = max(abs(finalU(indexVector(i:myLength),myLength)));
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
     indexVector([posicion i]) = indexVector([i posicion]); % Cambia de lugar i con la posicion, es decir
                                                        % [ M(1) M(2) .. M(pos) .. M(pos2) ] =>
                                                        % [ M(1) M(2) .. M(pos2) .. M(pos) ]
   endif

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



   finalU(indexVector(i),i:myLength) = finalU(indexVector(i),i:myLength) / finalU(indexVector(i),i); % divido las filas del
                                                                                                   % pivote por la base pivotal

   finalL(i:myLength,i) = finalU(indexVector(i),i:myLength) / finalU(indexVector(i),i); %descomposicion

   finalU(indexVector(i+1:myLength),i:myLength) = finalU(indexVector(i+1:myLength),i:myLength) - finalU(indexVector(i+1: myLength),i) * finalU(indexVector(i),i:myLength);
 endfor
end

