function [fP,it,t] = secant(f_x, p0 , p1, tol, maxIt)
    tic();
    it = 2; f_p0 = p0; f_p1 = p1;
    while it < maxIt
        fP = p1 - f_p1*(p1 - p2)/(f_p1 - f_p0);

        mResidue = abs(fP - p1);
        if mResidue < tol
            break;
        endif

        p0 = p1 ; f_p0 = f_p1;
        f_p1 = f_x(fP);

        it = it+1;
    endwhile
    t = toc();
end