function val = ej7()
    x = [0:200:1200];
    p = [4 3.95 3.89 3.80 3.60 3.41 3.30];
    a = [ 100 103 106 110 120 133 149.6 ];

    p.*a;
    val = comp_trap_dots(x,p.*a)
    val = comp_simp_dots(x,p.*a)
end