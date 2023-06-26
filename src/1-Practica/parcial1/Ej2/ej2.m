function res = ej2()
    %Recorda que un punto fijo es es un valor tal que f(x0) = x0
    %Dato z(0.02) = 0.02
    % z =  @(t) 0.04*sqrt(a+t).*(1-t) - t.*sqrt(3*a)
        
    format long;
    close all;
    a1=19;
    z1 =  @(t) 0.04*sqrt(a1+t).*(1-t) - t.*sqrt(3*a1)
    plotFunction(z1,-0.1,0.1,100,2)

    f_a = @(a) 0.04*sqrt(a+0.02).*(1-0.02)-sqrt(3*a).*(0.02)-0.02 % <- el 0.02 es porque pase lo del otro lado del igual
    plotFunction(f_a,-0.2,20,100,1)
    
    [a,it,t] = bisection(f_a,18,20,0.0000001,100000);
    
    z =  @(t) 0.04*sqrt(a+t).*(1-t) - t.*sqrt(3*a);
    disp("valor del coeficiente a")
    a
    [tF,it,t] = bisection(z,0,2,0.0000001,100000);
    plotFunction(z,-0.1,0.1,100,2)
    disp("valor de la raiz de z(t)")
    tF
end