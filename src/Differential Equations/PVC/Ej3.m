function ans = Ej2()
    close all; clear all; clc;
    format long;

    display("Para abs(b-a)/L = 0.1")
    L = 10 ; tR = [ 1 2 ]; yR = [1 2]; h = (1/L)
    f = @(x) [-2./x  2./x.^2  sin(log(x))./x.^2];
    [t1,u1] = dif_fin_dir(f,tR , yR, L);
    lerp([u1 t1],1)
    u1(end)
    t1(end)

    clear all;

    display("Para abs(b-a)/L = 0.01")
    L = 100 ; tR = [ 1 2 ]; yR = [1 2];
    f = @(x) [-2./x  2./x.^2  sin(log(x))./x.^2];
    [t1,u1] = dif_fin_dir(f,tR , yR, L);
    lerp([u1 t1],2)
    u1(end)
    t1(end)

    display("Funcion real: ")
    c2 = (1/70)*(8-12*sin(log(2))-4*cos(log(2)));
    c1 = 11/10 - c2; a = 1; b = 2;
    fReal = @(x) c1.*x + (c2./x.^2)-(3/10)*sin(log(x))-(1/10)*cos(log(x));
    plotFunction(fReal,a,b,100,1)
    plotFunction(fReal,a,b,100,2)

end
