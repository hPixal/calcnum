function [fP,it,t] = fixedPoint(f_x,p0,tolerance,maxIt) 
    tic();
    it = 1;
    while it < maxIt
        fP = f_x(p0); %Evaluo el valor de la funcion en p0

        mResidue = abs(fP - p0);
        if mResidue < tolerance
            break;
        endif
        it = it + 1;
        fP = p0;
    endwhile
    t = toc();
end