function res = Gareis_Ej3()
    format long;
    [A,b,x0] = iniciarMatriz(40);
    [L D U] = LDUdesc(A);
    err = 1e-5;
    mIT = 15000;  

    display("Condiciones iniciales");
    display("Matriz Final")
    A
    display("Vector x0")
    x0

    display("Vector de Expansion");
    b
    display("OCTAVE SOL \n")
    A\b' 

    [vectorFinalGauss,iteraciones,tiempo] = gauss_p(A , b');
     display("Gauss performance \n")
     tiempo
     iteraciones
     vectorFinalGauss   
    [vectorFinalJacobi,restJacobii,iteraciones,tiempo] = Jacobi(A, b' , x0' , mIT, err);
     display("Jacobi performance \n") %initialMatrix, equalVector, initialVector, mIT, tolerance
     radioEspJacobi = max(abs(eig(-inv(D)*(L+U))))
     tiempo
     iteraciones
     vectorFinalJacobi 
    w = 2/(1+sqrt(1-radioEspJacobi^2)); 
    [vectorFinalSeidel,restSeidel,iteraciones,tiempo] = GaussSeidel(A, b', x0', mIT, err);
     display("Gauss-Seidel performance \n")
     radioEspSeidel = max(abs(eig(-inv(D+L)*U)))
     tiempo
     iteraciones
     vectorFinalSeidel  
    [vectorFinalSOR,restSOR,iteraciones,tiempo] = sor(A, b', x0', mIT, err, 1.1);
     display("SOR performance \n")
     radioEspSOR = max(abs(eig(inv(D+w*L)*((1-w)*D-w*U))))
     tiempo
     iteraciones
     vectorFinalSOR 
     display("W optima: ")
     w = optimalW(A);
end

function [A,b,x0] = iniciarMatriz(n)
    A = (2*diag(ones(1,n),0)-1*diag(ones(1,n-1),1)-1*diag(ones(1,n-1),-1));
    for i=1:n
        A(i,i) *= i;
        b(i) = 1.5*i-6
    endfor
    x0(1:n) = 0;
end
