function res = Ej3()

    %%%%%%%%%%%% PROBLEMA DE BARRA CON CONDICION ROBIN %%%%%%%%%%%%
    
    long = 3; k0 = 1;%cR = 0;    % PARAMETROS
    a = 0; alpha = 21; b = long; %    BASE

    heatSource = @(x) -20.*sin(5.*(x-1)); %MODIFICAR ACORDE LA FUNC.

    p = @(x) 0.*x; %MODIFICAR ACORDE EL TIPO DE PROBLEMA
    q = @(x) 0.*x; %cR.*x./x;%MODIFICAR ACORDE EL TIPO DE PROBLEMA
    r = @(x) heatSource(x); 
    f = @(x) [ p(x) , q(x) , r(x) ];
    inter = [ a b ]; ycd = alpha;
    % -k0 * u' = H ( u - uE ) 
    % H*uE = k0 * u' + H * u
    % A = k0
    % B = H 
    % C = H*uE
    H = 5; uE = 10;
    rob = [ k0 H uE*H ]; 
    %rob = [k0 0 0]
    ycd = alpha; L = 2;

    %%%%%%%%%%%% PROBLEMA DE BARRA CON CONDICION ROBIN %%%%%%%%%%%%


    [x,y]=dif_fin_rob(f,inter,ycd,rob,L);

    tol = 1e-3; maxIT = 100000;

    
    for i=1:1:maxIT  

        past = y(end,1); L*=2;

        [x,y]=dif_fin_rob(f,inter,ycd,rob,L);
        present = y(end,1);
        
        err = abs(past-present);
        
        if err < tol
            disp("err < tol")
            break;
        endif

    endfor

    temperatura_derecha = present

    lerp([y x]);

    % Flujo extremo izquierdo (osea x = 0)
    % es igual a epsilon(x) = -k0*u'(x)

    % Como en el extremo izquierdo solo tengo los puntos siguientes
    % voy a derivar por definicion de la forma tradicional
    % [f(x+h) - f(x)] / h

    h = abs(a-b)/L;
    dx = ( y(end) - y(end-1) )/ h;
    %dx = (y(end) - y(end-2))/(2*h) central
    flujo = -k0*dx
    
end