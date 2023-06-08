function st = ej3()
    f = @(t,y) t*e^(3*t) - 2*y;%0 a 1
    dfdy = @(t,y) -2; t0 = 0; tF = 1; y0=0;
    trueF = @(t) (1/5)*t.*exp(3*t) - (1/25)*exp(3*t) + t.*(1/25)*exp((-2));

    figure 1;
    L=5;
    [t1,y1]=euler(f,t0,tF,y0,L);
    [t2,y2]=backEuler(f,t0,tF,y0,L);
    [t3,y3]=CN_newton(f,dfdy,t0,tF,y0,L);
    plotFunction(trueF,t0,tF,100,1);
    lerp([y1 t1],1);
    lerp([y2 t2],1);
    lerp([y3 t3],1);
    title("h=0.2");

    disp("Para h = 0.2 ")
    disp("Tabla euler: ")
    table1=[y1 t1]
    disp("Tabla back-euler: ")
    table2=[y2 t2]
    disp("Tabla CN_newton: ")
    table3=[y3 t3]
    
    figure 2;
    L=10;
    [t1,y1]=euler(f,t0,tF,y0,L);
    [t2,y2]=backEuler(f,t0,tF,y0,L);
    [t3,y3]=CN_newton(f,dfdy,t0,tF,y0,L);
    plotFunction(trueF,t0,tF,100,2);
    lerp([y1 t1],2);
    lerp([y2 t2],2);
    lerp([y3 t3],2);
    title("h=0.1");

    disp("Para h = 0.1 ")
    disp("Tabla euler: ")
    table1=[y1 t1]
    disp("Tabla back-euler: ")
    table2=[y2 t2]
    disp("Tabla CN_newton: ")
    table3=[y3 t3]

    figure 3;
    L=20;
    [t1,y1]=euler(f,t0,tF,y0,L);
    [t2,y2]=backEuler(f,t0,tF,y0,L);
    [t3,y3]=CN_newton(f,dfdy,t0,tF,y0,L);
    plotFunction(trueF,t0,tF,100,3);
    lerp([y1 t1],3);
    lerp([y2 t2],3);
    lerp([y3 t3],3);
    title("h=0.05");

    disp("Para h = 0.05 ")
    disp("Tabla euler: ")
    table1=[y1 t1]
    disp("Tabla back-euler: ")
    table2=[y2 t2]
    disp("Tabla CN_newton: ")
    table3=[y3 t3]
end
