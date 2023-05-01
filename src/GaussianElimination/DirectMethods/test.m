function [x] = test(A, b);
% programación con lazos o bucles, sin pivoteo
% calculo del sistema Ax=b;
% me dan resultados con menor tiempo de calculo
% la paso como datos la matriz del sistema Ax=b
% puedo armar una matriz ampliada o no. Aamp=[A1 b];
n = length(A(:,1));

% aca no generamos la matriz aumentada sino lo hacemos por separado (a y b)
for k = 1:n % representa la diagonal donde estan los pivotes
    [val,p] = max(abs(A(k:n,k))); % busca el maximo valor absoluto
                                  % incluyendo el pivot sobrre todos los
                                  % valores de la columna k debajo del
                                  % pivote
    p = p(1) + k-1; % actualizo posicion del pivote
    % Ahora intercambiamos filas
     A([k,p],:) = A([p,k],:); % matriz
     b([k,p]) = b([p,k]); % Termino lado derecho


     % Ahora estamos en condiciones de seguir con la eliminacion de gauss

     m = A(k+1:n,k)/A(k,k);
     A(k+1:n,k:n) = A(k+1:n,k:n) - m*A(k,k:n);
     b(k+1:n) = b(k+1:n) - m*b(k);
endfor
A
[x,it] = sustAtrasNO_I([ A b ] ,1 );
end
