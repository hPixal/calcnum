function cota = cotaError(f_x,pol,x0,x1,l)
    dx= abs(x1-x0)/l;
    vals = x0:dx:x1;
    m = max(abs(f_x(vals)));
    cota = (m/((length(vals) +1)!));
    for i = 1 : length(vals)
        cota = cota*abs(polyval(pol,vals(i)));
    endfor
end