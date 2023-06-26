function res = Ej3()
    close all; clear all; clc;
    format long; err = 1e-6;
    p_x = @(x) 230*x.^4 + 18*x.^3 + 9*x.^2- 221*x -9
    plotFunction(p_x,-1,2,400,1)
    [point1,it1,t] = bisection(p_x,-0.2,0.2,err,1000);
    disp("RAIZ 1: ")
    point1
    disp("ITERACIONES: ")
    it1
    [point2,it2,t] = bisection(p_x,0.8,1.1,err,1000);
    disp("RAIZ 2: ")
    point2
    disp("ITERACIONES: ")
    it2

    dp_x = @(x) 920*x.^3 + 54*x.^2 + 18*x-221;
    plotFunction(dp_x,-1,2,400,2)
    
    [point3,it3,t] = bisection(dp_x,0.5,0.8,err,1000);
    disp("POSICION DEL MINIMO: ")
    point3
    disp("VALOR DEL MINIMO: ")
    p_x(point3)
    disp("ITERACIONES: ")
    it1

    fix_dot = @(x) p_x(x) - x;
    plotFunction(fix_dot,-1,1,400,3)
    [point4,it1,t] = bisection(fix_dot,0.9,1.1,err,1000);
    disp("POSICION DEL PUNTO FIJO: ")
    point4
    disp("ITERACIONES: ")
    it1
    
    %npoint = 0.96;
    %for i = 1 : 1000000 
    %    npoint += 0.00000001;
    %    nimg = p_x(npoint);
    %    if abs(npoint - nimg) < err
    %        disp("se encontro puntofijo")
    %        break;
    %    endif
    %    i++;
    %endfor
    %nimg
    %npoint
end 