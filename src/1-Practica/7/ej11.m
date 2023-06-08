function e = ej11()
    f = @(t,u) [u(2);
            (2/t)*u(2) - (2/t^2)*u(1) + t*log(t)];

    t0 = 1; tF =2;
    y0 = [ 1 ; 0 ];
    realF = @(t) (7/4).*t + (1/2).*(t.^3).*log(t) - (3/4).*t.^3;

    plotFunction(realF,t0,tF,100,1);

    L = 5;
    disp("h=0.2");
    [t1,u1] = bashmoulmulti(f,t0,tF,y0,L)
    realU = realF(t1);
    max(abs(realU-u1))
    lerp([u1 t1],1)
end
