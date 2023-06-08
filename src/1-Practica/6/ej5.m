function salid = ej5()
        f_x = @(x) sin(pi*x);

    for n = 1 : 12 
        L = 5*2^n
        intNCcompuesta(f,a,b,L,1)
        intNCcompuesta(f,a,b,L,2)
    endfor
end