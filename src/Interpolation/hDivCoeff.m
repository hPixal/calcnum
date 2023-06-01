function coef = hDivCoeff(z,dots)
    % dots is [ f('n') ... f'' f' f x ; ... ]
    h = size(z,1);
    l = size(dots,2);
    n = size(dots,1);
    mi = l-1;
    if h == 1
        coef = dots(1,mi);
    else
        aux(1:h) = z(1);
        if isequal(aux,z)
            for i = 1:n
                if z(1) = dots(i,end)
                    coef = dots(i,l-mi);
                endif
            endfor
        else
            a = hDivCoeff(z(2:h),dots);
            b = hDivCoeff(z(1:h-1),dots);
            coef = (a-b)/(z(end,2) - z(1));
        endif
    endif
end