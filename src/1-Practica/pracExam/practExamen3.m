function res = practExamen3()
    close all; clc;
    m = 20;
    c = 10; L= 100; k = 20;
    t0 = 0; tF= 10; y0 = [20 30];

    fy = @(t,y) [ y(2); (-y(2)*c - k*y(1))/m];
    [t,y] = rk4(fy,t0,tF, y0, L);

    lerp([y(:,1) t],1);
end
