function intValue = trapezoidalTheory(f_x,ddf_ddx,a,b)
    g_x = @(x) x*f_x(x/2) + (x^3) * ddf_ddx(x/2) / 8;
end