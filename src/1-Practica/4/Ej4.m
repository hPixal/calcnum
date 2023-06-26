function res = Ej4()
    err = 1e-4;
    y = @(x) x.^2
    s = @(x) sqrt((x - 1).^2 + x.^4);
    ds = @(x) ((-1+2*(x-1)+2*x.^3)./(sqrt((x-1).^2 + x.^4)));
    plotFunction(s,-5,5,100,1);
    plotFunction(ds,-5,5,400,1);
    [point,it,t] = bisection(ds,0.7,1,err,10000)
    y2 = @(x) x.^2 - point; dy2 = @(x) x.*2;
    plotFunction(y2,-5,5,400,1);
    [fP,it,t] = newton(y2,dy2,0.9,err,10000)
end