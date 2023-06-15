function ans = Gareis_Ej1()
    disp("parte 1");
    x = [ 0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0 ];
    y = [ 4.07 4.44 5.11 5.53 5.72 5.12 3.87 2.08 0.14 -1.29 -1.76 ];
    w = @(x) cos(x*pi/2);
    u =  w(x);
    disp("coeficientes")
    myPol = polyfit(u,y,2)
    disp("parte 2")
    realF = @(x) polyval(myPol,w(x));
    plotFunction(realF,0,2,200,1)
    plotDots([y' x'],1)
    disp("Error")
    err = abs(realF(1) - 5.12)
end
