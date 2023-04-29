function [fP,it,t] = newton(f_x,df_dx,p0,tol,maxIt)
    tic();
    it = 1;
    while it < maxIt
        fP = p0 - f_x(p0)/df_dx(p0);

        mResidue = abs(fP - p0);
        if mResidue < tol
            break;
        endif

        p0 = fP;

        it = it + 1;
    endwhile
    t = toc();
    plotFunction(f_x,p0-5,p0+5,100,1);
    plotDots([ f_x(fP) fP ], 1 );
end