function [finalVal,it,t,r] = trapezoidal1(f_x,a,b,tol,maxIt)
    tic();
    dist = abs(a-b);
    last = 0;
    for i = 1 : maxIt
        dX = dist/i;
        current = (dX/2)*(f_x(a)+f_x(b));
        for j = a :dX:b
            current = current + dX*(f_x(j));
        endfor

        r(i) = abs(current-last);
        if(r(i) < tol)
            finalVal = current;
            it = i;
            break;
        endif

        last = current;
    endfor
    plotVector(r,1);
    it = maxIt;
    t = toc();
end
