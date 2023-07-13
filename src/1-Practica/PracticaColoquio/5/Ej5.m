function e = ej10()
    long = 9.81; h = @(t) 
    f = @(t,u) [u(2);  h(t)*u(2)+ sin(u(1))];
    y0 = [ 0.1 ; 0 ];
    t0 = 0; tF = 20; L = 400;
    [t1,u1] = rk4(f,t0,tF, y0, L)
    lerp([u1 t1],1)
end