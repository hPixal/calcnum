function res = Ej4()

    %%%%%%%%%%%% PROBLEMA DE BARRA CON CONDICION ROBIN %%%%%%%%%%%%
    
    long = 2; k0 = 0.57; c = 0.217; H = 15; A = 0.01; % PARAMETROS
    a = 0; alpha = 6; b = long; P = 2.7; uE = 4;      %    BASE

    heatSource = @(x) -2.*x.*(2-x); %MODIFICAR ACORDE LA FUNC.
    cR = @(x) 0.1.*(x.^3)+ 2.5;

    p = @(x) 0.*x; %MODIFICAR ACORDE EL TIPO DE PROBLEMA
    q = @(x) cR(x)./k0; %MODIFICAR ACORDE EL TIPO DE PROBLEMA
    r = @(x) heatSource(x)./k0; 
    f = @(x) [ p(x) , q(x) , r(x) ];
    inter = [ a b ]; ycd = alpha;
    % -k0 * u' = H ( u - uE ) 
    % H*uE = k0 * u' + H * u
    % A = k0
    % B = H 
    % C = H*uE

    rob = [ k0 H uE*H ]; 
    %rob = [k0 0 0]
    ycd = alpha; L = 2;

    %%%%%%%%%%%% PROBLEMA DE BARRA CON CONDICION ROBIN %%%%%%%%%%%%


    [x,y]=dif_fin_rob(f,inter,ycd,rob,L);

    tol = 1e-5; maxIT = 100000;

    
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

    %lerp([y x]);

    % Flujo extremo izquierdo (osea x = 0)
    % es igual a epsilon(x) = -k0*u'(x)

    % Como en el extremo izquierdo solo tengo los puntos siguientes
    % voy a derivar por definicion de la forma tradicional
    % [f(x+h) - f(x)] / h

    h = abs(a-b)/L;
    dx = (3*y(end) - 4*y(end-1) + y(end-2))/(2*h);
    %dx = (y(end) - y(end-2))/(2*h) central
    flujo = -k0*dx
    valorIntegral = SimpsonComp(x,y)
    energia_termica = valorIntegral*A*c*P
end