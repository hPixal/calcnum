function out =ej1()
    f_x = @(x) exp(x) - 2*x.^2 + 3*x - 1
    ddf_ddx = @(x) exp(x) - 4;
    x0 = 0;
    figure 1;
    hold on;
    for h = 1 :-0.01:0.01
        dx = diff2D(f_x,h,x0)
        err = linearError2D(ddf_ddx,h,x0)
        plot(h,err);
    endfor
    %Para sorpresa de nadie, mientras mas chico el h, menor es el error.

    dddf_dddx = @(x) exp(x)
    for h = 1 :-0.01:0.01
        dx = diff3D(f_x,h,x0)
        err = linearError3D(dddf_dddx,h,x0)
        plot(h,err);
    endfor
    %También, para sorpresa de nadie, el error de esta formula se hace muchisimo más chico más rapido que la forma anterior
    dddf_dddx = @(x) exp(x)
    for h = 1 :-0.01:0.01
        dx = diff5D(f_x,h,x0)
        err = linearError5D(dddf_dddx,h,x0)
        plot(h,err);
    endfor
    %Este tiene un error medio violento x^2 pero para valores posta muy chico esta bueno
end