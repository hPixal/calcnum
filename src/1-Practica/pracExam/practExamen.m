function e = practExamen()
    m = 10;
    c = 0.2;
    g = 9.81;

    ay = @(u) -g - c*u/m;
    ax = @(u) -c*u/m;

    L = 200;
    t0 = 0;
    tF = 1;
    y0 = 30;
    x0 = 0;

    P_x = @(t,u) x0 + u*t + (1/2)*ax(u)*t.^2;
    P_y = @(t,u) y0 + u*t + (1/2)*ay(u)*t.^2;

    [t, y] = rk4(P_y, t0, tF, y0, L);
    [~, x] = rk4(P_x, t0, tF, x0, L);

    lerp([y t],1);
    lerp([x t],2);
    lerp([y x],3);
end
