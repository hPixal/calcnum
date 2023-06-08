function [t,y] = myEuler(f_ty,t0,tF,y0,l)
    dT = (tF-t0)/l;
    t = t0:dT:tF;
    t(1) = t0; y(1) = y0;

    for i = 1 : length(t)-1
        y(i+1) = y(i) + dT*(f_ty(t(i),y(i)));
    endfor
    t = t'; y = y';
    edoPlot(f_ty,t,y);
end
