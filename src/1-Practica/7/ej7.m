function res = ej7()
    f = @(t,x) ([ - t * x(2); t * x(1) - t*x(2) ]);
    t0 = 0; tF = 20; L = 400; y0 = [1 ; -1];
    [t,y] = euler(f,t0,tF,y0,L);
    lerp([y t],1)
end
