function [L,D,U]= LDUdesc(initialMatrix)
    vector = diag(initialMatrix)
    L=tril(initialMatrix,-1);
    U=triu(initialMatrix,1);
    D=diag(vector);
end