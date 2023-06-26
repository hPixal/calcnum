function res = Ej4()
    err = 1e-10; format long;
    f_x = @(x) sin(x) + cos(1+x.^2)-1
    plotFunction(f_x,7.9,8,400,1)
    [point,it,t] = bisection(f_x,7.8,8,err,100)
end