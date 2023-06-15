function cota = cotaErrorList(y,pol,x)
    n = length(y);
    cota = 0;
    for i = 1 : 1 :n
        cota += (y(i)-polyval(pol,x(i)))^2
    endfor
endfunction
