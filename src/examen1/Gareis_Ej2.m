function varout = Gareis_Ej2()
    f = @(t) 0.04 .* sqrt (19 + t) .* (1 - t) - t .* sqrt (3 * 19);
    rang = f(0.02);
    g = @(a) 0.04 * sqrt(a+0.02) * (1-0.02) - t * sqrt(3*a) - rang;
    plotFunction(g,rang-2,rang+2,100,3)
    plotFunction(f,1,5,100,2)
    [aVal,it,t] = bisection(g,0,0.5,e-6,10000);
    f2 = @(t) 0.04 .* sqrt (aVal + t) .* (1 - t) - t .* sqrt (3 * aVal);
    [root,it,t] = bisection(f2,-1,2 ,e-6,10000);

    varout = 1;
end