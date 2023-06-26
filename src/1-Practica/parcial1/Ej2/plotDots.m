function succesful = plotDots(dotsVector,figNumber)
    succesful = 0; 
    for i = 1 : size(dotsVector)(1)

        figure(figNumber)
        plot(dotsVector(i,2),dotsVector(i,1),'bo','MarkerSize', 10)
        grid on
        grid minor
        hold on
        
    endfor
    succesful = 1;
end
