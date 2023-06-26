function [A,b,x0] = iniciarMatriz(n)
    A = (2*diag(ones(1,n),0)-1*diag(ones(1,n-1),1)-1*diag(ones(1,n-1),-1));
    for i=1:n
        A(i,i) *= i;
        b(i) = 1.5*i-6
    endfor
    x0(1:n) = 0;
end 