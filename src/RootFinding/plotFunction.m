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
