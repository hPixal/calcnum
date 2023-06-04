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

    longarc = @(t) sqrt(dX(t).^2 + dY(t).^2)
    format long;
    intvalue = intNCcompuesta(longarc,0,6,6,19);
end
