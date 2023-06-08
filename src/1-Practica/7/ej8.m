function res = ej8()
    f = @(t,x) ([ x(1)*(3-0.002*x(2)); -x(2)*(0.5 - 0.0006*x(1))]);
    t0 = 0; tF = 20; L = 400; y0 = [1600 ; 800];
    [t,y] = euler(f,t0,tF,y0,L);
    lerp([y t],1)
end
