function succesful = plotDots(dotsVector,fig)
    succesful = 0;
    for i = 1 : length(dotsVector')

        figure(fig)
        plot(dotsVector(i,2),dotsVector(i,1),'bo','MarkerSize', 10)
        grid on
        grid minor
        hold on
        
    endfor
    succesful = 1;
end
