function ans = practExam()
    realF = @(x) log(x.^2 + 1) - cos(x.*pi).*e.^(x./2);
    h = (6+5)/9
    x = -5:h:6
    y = realF(x);
    diff2D(realF(-5))
    [s ds] = funcion_spline(x,y);
    abs(s(4.2) - realF(4.2))
end
