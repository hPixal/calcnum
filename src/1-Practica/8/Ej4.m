function res = Ej4()
    close all; clear all; clc;
    format long;

    display("Para abs(b-a)/L = 0.01")
    L = 100 ; inter = [ 1 2 ]; ycd = 1 ; rob = [0 1 2];
    f = @(x) [-2./x  2./x.^2  sin(log(x))./x.^2];
    [t1,u1]=dif_fin_rob(f,inter,ycd,rob,L)
    lerp([u1 t1],1)
    u1(end)
    t1(end)

    display("Funcion real: ")
    c2 = (1/70)*(8-12*sin(log(2))-4*cos(log(2)));
    c1 = 11/10 - c2; a = 1; b = 2;
    fReal = @(x) c1.*x + (c2./x.^2)-(3/10)*sin(log(x))-(1/10)*cos(log(x));
    plotFunction(fReal,a,b,100,1)
end