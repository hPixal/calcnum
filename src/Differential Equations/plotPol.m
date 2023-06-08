function succesful = plotPol(pol,a,b,it,fig)

    succesful = 0;
    x = linspace(a,b,100);
    y = polyval(pol,x);

    figure(fig)
    plot(x,y)
    grid on
    grid minor
    title("Gráfica del/los Polinomio/s")
    hold on
    succesful = 1;
end
