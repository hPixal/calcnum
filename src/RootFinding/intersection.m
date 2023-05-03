function [point,it,t] = intersection(f_x,g_x,tolX,maxIt)
    proceed = 'n';
    x0 = 0; x1 = 1;
    while proceed != 'y'
        display("Set the initial values to graph both functions \n iterate till you find a range for the intersection.")
        prompt = "Set initial x value [x0] :  ";
        x0 = input(prompt);
        prompt = "Set the second x value [x1] :  ";
        x1 = input(prompt);

        plotFunction(f_x,x0,x1,100,1)
        plotFunction(g_x,x0,x1,100,1)

        prompt = "Do you want to proceed and calculate the intersection? y/n [y]: ";
        proceed = input(prompt,"s");
        if isempty(proceed)
            proceed = 'y';
        endif
        close all;
    endwhile
    h_x = @(x) f_x(x) - g_x(x);
    [point,it,t] = bisection(h_x,x0,x1,tolX,maxIt);
    close all;
    plotFunction(f_x,x0-2,x1+2,100,1)
    plotFunction(g_x,x0-2,x1+2,100,1)
    plotFunction(h_x,x0-2,x1+2,100,1)
    plotDots([ f_x(point) point ], 1 );
end