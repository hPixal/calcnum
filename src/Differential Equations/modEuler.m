function [t,y] = modEuler(f_ty,t0,tF,y0,l)
    dT = (tF-t0)/l;
    t = t0:dT:tF;
    t(1) = t0; y(1) = y0;

    for i = 1 : length(t)-1
        pred = y(i) + dT*(f_ty(t(i),y(i)));
        y(i+1) = y(i) +(dT/2)*(f_ty(t(i),y(i))+f_ty(t(i+1),pred));
    endfor
    t = t'; y = y';
    %edoPlot(f_ty,t,y);

end