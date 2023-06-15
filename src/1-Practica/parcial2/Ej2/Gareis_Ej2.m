function ans = Gareis_Ej2()
    % Constantes
    close all;
    cE = 2.1e6 ; cI = 4250;  cP = 3000; cL = 120;
    y0 = [ 0 0 ];

    f = @(x,y) [ y(2) ; (cL-x).*(1 + (y(2).^2).^(3/2)).*cP /(cE*cI) ]


    L = 2; last = -999;
    [x,y] = rk4(f,0,cL, y0, L);
    current = y(end,1);
    while abs(current - last) > 0.0001
        disp("Ejecución")
        last = current; L = L*2
        [x,y] = rk4(f,0,cL, y0, L);
        current = y(end,1);
    endwhile
    disp("deformacion")
    max(y(:,1))
    lerp([y(:,1) x],1)

    last = 1000; nL = 3;
    while last > 0.0019
        nL = nL - 0.0001
        [x,y] = rk4(f,0,nL, y0, L);
        last = y(end,1)
    endwhile
    disp("ultimo")
    last
end
