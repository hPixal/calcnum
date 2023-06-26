function res = ej6()
    A = [ 1 -2 3 0 ; 3 -6 9 3 ; 2 1 4 1 ; 1 -2 2 -2 ];
    [A1,L,U,P,Z,Z1] = Doolitle_p(A)
    P*A
    L*U
end