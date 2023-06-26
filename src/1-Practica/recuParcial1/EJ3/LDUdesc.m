function [L,D,U]= LDUdesc(initialMatrix)
    v = diag(initialMatrix); % Diag anda raro, si tiene un vector te crea una matriz, si tiene una matriz te crea un vector.
    L = tril(initialMatrix,-1);% por eso la variable "v" y no solo diag(initialMatrix), me costo un monton darme cuenta de esto.
    D = diag(v);
    U = triu(initialMatrix,1);
end
