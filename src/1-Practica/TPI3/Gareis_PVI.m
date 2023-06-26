function pos = exam()
    long = 1;
    f = @(t,u) [u(2); -u(2) - sin(u(1))+20*cos(u(1)).^2];
    y0 = [ pi/2 ; 0 ];
    t0 = 0; tF = 2.5; L = 400;
    [t1,u1] = rk4(f,t0,tF, y0, L)
    lerp([u1(:,2) u1(:,1)],1)
    pos  =  u1(end,1)


    y0 = [ pi/2 ; 0 ];
    t0 = 0; tF = 4; L = 200;
    [t2,u2] = rk4(f,t0,tF, y0, L)
    lerp([u2(:,2) u2(:,1)],2)

    %ahora voy a hacer otra grafica más con menor precision solo para ver lo del angulo
    y0 = [ pi/2 ; 0 ];
    t0 = 0; tF = 10; L = 100;
    [t3,u3] = rk4(f,t0,tF, y0, L)
    lerp([u3(:,2) u3(:,1)],3)
end