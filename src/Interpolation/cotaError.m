function cota = cotaError(f_x,pol,x0,x1,div)
    dx= abs(x1-x0)/div;
    vals = x0:div:x1;
    m = max(abs(f_x(vals)));
    cota = (m/((length(vals) +1)!));
    for i = 1 : length(vals)
        cota = cota*abs(x-vals(i));
    endfor
end