function coef = newtonCoef(dots)
    n = size(dots,1); %newton([X1, X2],[Y1 Y2],COEF):- coef is ( Y1-Y2 )/( X1-X2 ). 
    if n == 1
        coef = dots(1,1);
    else 
        a = newtonCoef(dots(2:n,:));
        b = newtonCoef(dots(1:n-1,:));
        coef = (a-b)/(dots(n,2) - dots(1,2));
    endif
end