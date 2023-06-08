function e = ej9()
    f = @(t,u) [u(2);u(3);-4*u(3)-5*u(2)-2*u(1)-4*sin(t)-2*cos(t)];
    y0 = [ 1 ; 0 ; -1 ];
    t0 = 0; tF = 2.5; L = 250;
    [t1,u1] = rk4(f,t0,tF, y0, L)
    y25 = u1(end,:)
    t0 = 0; tF = 15; L = 300;
    [t2,u2] = rk4(f,t0,tF, y0, L)
    lerp([u2 t2],1)
end
