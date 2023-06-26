function res = ej4()
    A = [1 -1 2 -1 ; 0 2 -1 1 ; 0 0 -1 -1 ; 0 0 0 2 ];
    b = [ -8 ; 6 ; -4 ; 4 ];
    disp("Sustitucion hacia atras : ")
    sust_atras(A,b)
    disp("Resolucion de matlab : ")
    A\b
end