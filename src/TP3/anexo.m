% x: puntos xi, i=1,2,...,n
% y: puntos yi correspondiente a f(xi), i=1,2,...,n
% df1 y dfn: valor de la derivada de f en x0 y xn
function [ai,bi,ci,di] = cubic_spline_clamped(x,y,df1,dfn)
    n = length(x);

    ai = y;

    h(1:n-1) = x(2:n) - x(1:n-1);

    % - Calculamos los terminos independientes
    b(1:n) = 0;
    b(1) = 3*( (y(2) - y(1))/h(1) - df1 );    %fila 1
    b(2:n-1) = 3*( (y(3:n) - y(2:n-1))./h(2:n-1) - (y(2:n-1) - y(1:n-2))./h(1:n-2) );   %filas 2...n-1
    b(n) = 3*( dfn - (y(n) - y(n-1))/h(n-1) );    %fila n

    % - Calculamos (metodo de crout)
    l(1) = 2*h(1); 
    u(1) = 0.5;
    z(1) = b(1)/l(1);

    for i = 2:n-1
        l(i) = 2 * ( x(i+1)-x(i-1) ) - h(i-1) * u(i-1);
        u(i) = h(i) / l(i);
        z(i) = (b(i) - h(i-1) * z(i-1) ) / l(i);
    endfor

    l(n) = h(n-1) * (2-u(n-1));
    z(n) = (b(n) - h(n-1)*z(n-1) ) / l(n);
    ci(n) = z(n);

    % Paso 7:
    for i = n-1:-1:1
        ci(i) = z(i) - u(i) * ci(i+1);
        bi(i) = (y(i+1)-y(i))/ h(i) - h(i) * ( ci(i+1) + 2 * ci(i) ) / 3;
        di(i) = (ci(i+1)-ci(i))/(3*h(i));
    endfor

    ai = y(1:n-1)';
    bi = bi';
    ci = ci(1:n-1)';
    di = di';
endfunction

function [a, b, c, d] = cubic_spline_natural(x,y)
    # Pasamos un arreglo de puntos x e y
    # Es una función para el calculo de una Spline Cúbica Natural, es decir con 
    # derivadas segundas nulas en el contorno del dominio.
    # Programado en base a Burden Edición 10 pag 110. 
    # Ojo tener cuidado el contador i está inicializado en 1.
    # S(x) = Sj(x) = aj + bj(x-xj) + cj(x-xj)^2 + dj(x-xj)^3 para xj <= x <= xj+1;
    # S''(x1) = 0  , S''(xn+1) = 0 (libre o natural)

    % Medimos la longitud de los datos
    n = length(x);
    alpha = zeros(n,1);
    c = alpha;

    % Paso 1: Calculamos los h de cada Spline.
    h(1:n-1) = x(2:n)-x(1:n-1); # sin usar el lazo

    % Paso 2: Calcula los terminos independientes (alpha)
    alpha(2:n-1) = 3*( (y(3:n) - y(2:n-1))./h(2:n-1) - (y(2:n-1) - y(1:n-2))./h(1:n-2) );   %filas 2...n-1

    # Resolvemos el sistema lineal tridiagonal (Factorización de Crout)
    % Paso 3:
    l = ones(n,1);
    u = zeros(n,1);
    z = zeros(n,1);

    % Paso 4: 
    for i = 2:n-1
        l(i) = 2*(x(i+1)-x(i-1))-h(i-1)*u(i-1);
        u(i) = h(i)./l(i);
        z(i) = (alpha(i)-h(i-1)*z(i-1))./l(i);
    endfor

    %Paso 6:

    for i = n-1:-1:1
        c(i) = z(i)- u(i)*c(i+1);
        b(i) = (y(i+1)-y(i))./h(i)-(h(i)*(c(i+1)+2*c(i)))/3;
        d(i) = (c(i+1)-c(i))./(3*h(i));
    endfor

    a = y(1:n-1)';
    b = b';
    c = c(1:n-1);
    d = d';
 endfunction

 function [S,dS]=funcion_spline(x1,y1,df1,df2)

    %la modifique un toque para que además grafique y
    %que defaultee df1 y df2 a 0 y haga un spline natural
    %si no le pasas esos parametros

    nargin

    if nargin < 3
        [a,b,c,d] = cubic_spline_natural(x1,y1);
    elseif nargin == 3
        [a,b,c,d] = cubic_spline_clamped(x1,y1,df1,df1);
    else
        [a,b,c,d] = cubic_spline_clamped(x1,y1,df1,df2);
    endif

    S=@(x) a(1)*(x==x1(1));

    M=[d c b a];
    dM=[];
    dS= @(x) 0;
    for i=1:length(x1)-1
        dM=[dM;polyder(M(i,:))];
        S=@(x) S(x) + polyval(M(i,:),x-x1(i)).*(x>x1(i)).*(x<=x1(i+1));
        dS=@(x) dS(x) + polyval(dM(i,:),x-x1(i)).*(x>x1(i)).*(x<=x1(i+1));
    endfor

    dots(:,1)=y1';
    dots(:,2)=x1';

    % - THIS IS FOR PLOTTING PORPUSES - %
    plotFunction(S,x1(1),x1(end),100,1);%
    plotDots(dots,1);                   %
    % --------------------------------- %

    % - THIS IS FOR PLOTTING PORPUSES -  %
    plotFunction(dS,x1(1),x1(end),100,2);%
    plotDots(dots,2);                    %
    % ---------------------------------  %

end

function succesful = plotDots(dotsVector,figNumber)
    succesful = 0;
    for i = 1 : length(dotsVector')

        figure(figNumber)
        plot(dotsVector(i,2),dotsVector(i,1),'bo','MarkerSize', 10)
        grid on
        grid minor
        hold on
        
    endfor
    succesful = 1;
end

function res = plotFunction(f_x,a,b,ndots,figNumber)

    succesful = 0;
    x = linspace(a,b,ndots);
    y = f_x(x);

    figure(figNumber)
    plot(x,y)

    grid on
    grid minor
    title("Gráfica de la función")
    hold on
    line([a b],[0 0],'color','r')
    succesful = 1;

end

function [finalVal,it,t,r] = simpson(f_x,a,b,tol,maxIt)
    tic();
    dist = abs(a-b);
    last = 0;
    finalVal = 0;
    for i = 1 : maxIt
        n = 2*i;
        w = simpsonWeight(n);
        dx = abs(a-b)/n;
        it = 0;

        for j = a:dx:b
            it++;
            finalVal = finalVal + f_x(j)*w(it);
        endfor
        finalVal = finalVal * dx/3;
        if abs(finalVal - last) < tol
            break;
        endif
        last = finalVal;
    endfor
    t = toc();
end

function weights = simpsonWeight(n)
    if rem(n,2) ~= 0
        error("n is not even");
    else
        weights(1:n) = 2;
        weights(2:2:n) = 4;
        weights(1) = 1;
        weights(n+1) = 1;
    endif
end

function intvalue = tp3()
    %Valores iniciales
    ty = 0:1:6
    tx = 0:2:6
    x = [ 2.0 1.5 0.5 0.0 ];
    y = [ 0.0 1.0 0.0 -1.0 0.0 1.0 0.0];

    %Obtengo los splines
    [sX,dX] = funcion_spline(tx,x);
    [sY,dY] = funcion_spline(ty,y,pi/2,-pi/2);

    %Obtengo un intervalo
    plotX = sX(0:0.1:6);
    plotY = sY(0:0.1:6);

    %Ploteo
    figure 3;
    hold on;
    grid on;
    title("Grafica de g(x(t),y(t))");
    line([0 2],[0 0],'color','g')
    plot(plotX,plotY);

    longarc = @(t) sqrt(dX(t).^2 + dY(t).^2);
    format long;
    last= 1; intvalue=0;
    count = 10;
    while true
        count = 2*count;
        last = intNCcompuesta(longarc,0,6,count,2);
        count++;
        intvalue = intNCcompuesta(longarc,0,6,count,2);
        if(abs(last-intvalue) < 1e-6)
          break;
        endif
    endwhile
    intvalue;
end


function w = pesosNC(n)
% function w = pesosNC(n)
% se calculan los pesos
% de la formula de Newton-Cotes de n puntos

x = linspace(0,1,n);
A = ones(n,n);
for i=2:n
A(i,:) = A(i-1,:) .* x;
end
b = 1./(1:n)';
w = A\b;
end

function Q = intNCcompuesta(f,a,b,L,n)
% function Q = intNCcompuesta(f,a,b,L,n)
% aproxima la integral de f sobre [a,b]
% utilizando la formula de Newton-Cotes compuesta
% de n puntos, subdividiendo en L subintervalos
y = linspace(a,b,L+1);
h = (b-a)/L;
% calculamos los pesos una sola vez
w = pesosNC(n);
Q = 0;
for i=1:L
x = linspace(y(i),y(i+1),n);
fx = f(x);
Q = Q + h*(fx*w);
end
end