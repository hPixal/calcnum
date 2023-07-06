function res = Ej6()
    k0 = 0.9;
    H = 15;
    uE = 4;

    A = k0;
    B = H;
    C = - uE*H;

    rob = [ A B C ];

    lon = 5; tol = 1e-4;
    L = 10; ycd = 6; inter = [ 0 lon/2 ];

    cR = @(x) 1.05*x + 2; hSource = @(x) 5*x.*(5-x)

    f = @(x) [ 0*x cR(x)./k0 -hSource(x)./k0 ]
    

    [x,y]=dif_fin_rob(f,inter,ycd,rob,L)
    yEnd = y(end,1);
    current = 0;
    clear y; clear x;
    while abs(yEnd-current) > tol
        yEnd = current; L*=2;
        [x,y]=dif_fin_rob(f,inter,ycd,rob,L);
        current = y(end,1)
    endwhile
    display("encontro")
    L = 20;
    [x,y]=dif_fin_rob(f,inter,ycd,rob,L)
    lerp([y x],1)
    yEnd 
end