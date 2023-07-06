function res = Gareis()
    format long;

    p = @(x) (-11/3)./x
    q = @(x) 1./(x.^2)
    r = @(x) -log(x)./(x.^2) + (8/3)*1./(x.^2)

    f = @(x) [ p(x) , q(x) , r(x) ]    
    inter = [ 1 4 ]; yc = [ 1 2.9736954 ]; 
    tol1 = 1e-7; h = 0.5; L = (abs((inter(end)-inter(1)))/h);

    [x,y] = dif_fin_dir(f,inter,yc,L);

   
    p = find( x == 2.5 );past = y(p,1);
    clear y; clear x; it = 1;
    
    for i = 1 : 1 : 10000

        L*=2;
        
        [x,y] = dif_fin_dir(f,inter,yc,L);

        p = find( x == 2.5 );
        present = y(p);

        err = abs(past - present);
        if(err < tol1 )
            break;
        endif

        past = present;
    endfor

    % ANS = 2.273499550697292

    p = find( x == 2.5 );dxPast = y(p,1);
    clear y; clear x; it = 1; tol2 = 1e-4;
    
    for i = 1 : 1 : 10000

        L*=2;
        
        [x,y] = dif_fin_dir(f,inter,yc,L);

        p = find( x == 2.5 );
        h = (abs((inter(end)-inter(1)))/L);
        dxPresent = (y(p+1) - y(p-1))/(2*h);

        err = abs(dxPast - dxPresent);
        if(err < tol2 )
            break;
        endif

        dxPast = dxPresent;
    endfor

    punto = present;
    derivada = dxPresent;
    integral = SimpsonComp(x,y);
    disp("Valor del punto      :" )
    punto
    disp("Valor de la derivada :" )
    derivada
    disp("Valor de la integral :" )
    integral
    

end 