function pl = edoPlot(f_ty,t,y)
    dT = (t(1)-t(end))/length(t);
    t0  = t(1)-2*dT; tF = t(end)+2*dT;

    dY = (max(y)-min(y))/length(y);
    y0 = min(y)-2*dY 
    yF = max(y) + 2*dY

    %hold on;
    %fig = slope_field(f_ty,[t0 tF],[y0 yF])
    lerp([y t],1)

end
