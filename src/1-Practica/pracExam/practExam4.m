function en = practExamen4()
    fxy = @(t,y) [y(3) ; y(2) ; -4*y(3)-5*y(2)-2*(1) - 4*sin(t)-2*cos(t)];
    y0 = [1 0 -1];
    t0 = 0; tF = 2.5; L = 200;
    [t,y] = rk4(fxy,t0,tF, y0, L);

    lerp([y(:,1) t],1);
    
end