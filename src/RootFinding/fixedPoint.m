function [fP,it,t] = fixedPoint(f_x,p0,p1,tolerance,maxIt) 
    tic();
    it = 1;
    q0 = f_x(p0); q1 = f_x(p1);
    while it < maxIt
        fP = p1 - q1*(p1-p0)/(q1-q0); %Evaluo el valor de la funcion en p0

        mResidue = abs(fP - p0);
        if mResidue < tolerance
            break;
        endif
        p0 = p1 ; q0 = q1;
        p1 = fP; q1 = f_x(fP);
        it = it + 1;
        fP = p0;
    endwhile
    t = toc();
    plotFunction(f_x,p0-5,p1+5,100,1)
    plotDots([ f_x(fP) fP ], 1 );
end