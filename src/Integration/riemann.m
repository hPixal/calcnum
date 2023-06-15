function val = riemann(f_x,a,b,tol)
    past = 1000;
    val = 0;
    l = 1;
    while (abs(past-val) > tol)
        past = val;     
        h = (b-a)/l;
        for i = a:h:b
            val += f_x(i)*h; 
        endfor
    endwhile
end