function [intValue] = midpointTheory(f_x,df_dx,ddf_ddx,a,b)
    g_x = @(x) x*f_x(x/2) / 24 + (x^3) * ddf_ddx(x/2) / 1920;
    intValue = g_x(a) - g_x(b);  
end