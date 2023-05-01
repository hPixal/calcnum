function [finalMatrix,it,t]  = gaussNO_IPV(initialMatrix,equalVector)
%Este codigo ejecuta eliminacion gaussiana sin pivoteo sin indexado y no vectorizado
%y sin eliminar los errores de redondeo de la maquina (ANDA)
    tic();
    mLength = length(initialMatrix);
    initialMatrix = [ initialMatrix equalVector ];
    it = 1;

    for dgn = 1 : mLength-1  % This for is called dgn because it will travel 
                             % the matrix diagonally
      base = initialMatrix(dgn,dgn);

      for dwd = dgn+1 : mLength % This for is called fwd because it will travel
                                % the elements downward the diagonal element

        coef = (-1)*initialMatrix(dwd,dgn)/base; %  | a(2,1) + coef* a(1,1) = 0 | then | coef = - a(2,1)/a(1,1) |
        initialMatrix(dwd,dgn) = 0; % because of the operation above, we already know that this will equal 0.

        for fwd = dgn+1 : mLength+1 % This for is called fwd because it will travel
                                  % the elements forward the diagonal element
            initialMatrix(dwd,fwd) = initialMatrix(dwd,fwd) + coef*initialMatrix(dgn,fwd);
            it++;
        endfor
        it++;
      endfor
      it++;
    endfor
    [finalMatrix,it] = sustAtrasNO_IV(initialMatrix,it);
    t = toc();
end
