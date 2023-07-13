function ans = Gareis()
    format long;

    p = @(x) 2.*x./(1-x.^2)
    q = @(x) -42./(1-x.^2)
    r = @(x) 0.*x

    %Defino un L a traves de h porque como se que está en el medio,
    %quiero un paso en la recursividad que me asegure conseguir siempre,
    %de modo preciso x = 0. 
    f = @(x) [ p(x) , q(x) , r(x) ]    
    inter = [ -1 1 ]; yc = [ 1 1 ]; 
    tol1 = 1e-7; h = 0.5; L = (abs((inter(end)-inter(1)))/h);

    [x,y] = dif_fin_dir(f,inter,yc,L);

   
    p = find( x == 0 );past = y(p,1);
    clear y; clear x;
    
    for i = 1 : 1 : 10000

        L*=2;
        
        [x,y] = dif_fin_dir(f,inter,yc,L);

        p = find( x == 0 );
        present = y(p);

        err = abs(past - present);
        if(err < tol1 )
            disp("encontro con tolerancia")
            break;
        endif

        past = present;
    endfor

    [x2,y2] = dif_fin_dir(f,inter,yc,50);
    lerp([y2 x2]);


    p = find( x == 0 );
    disp("valor en el punto 0 : ")
    y(p)
    disp("coeficientes del polinomio: ")
    pol = polyfit(x,y,6)

    res = @(x) polyval(pol,x);

    disp("Raices positivas : ")
    p1 = bisection(res,0.2,0.3,1e-8,10000)
    p2 = bisection(res,0.6,0.7,1e-8,10000)
    p3 = bisection(res,0.89,0.99,1e-8,10000)
end 
 