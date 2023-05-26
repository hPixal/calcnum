function succesful = plotVector(y,figNumber)

    succesful = 0;
    x = [0:length(y)];

    figure(figNumber)
    plot(x,y)

    grid on
    grid minor
    title("Gráfica de la función")
    hold on
    line([a b],[0 0],'color','r')
    succesful = 1;

end
