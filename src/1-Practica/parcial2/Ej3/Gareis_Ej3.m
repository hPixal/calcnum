function a = exam2()
    f_x = @(x) 2.5 + x.*cos(x*2); df_x = @(x) cos(x*2) - (x*2).*sin(x*2);
    r_x = @(x) (2*pi)*f_x(x).*sqrt(1 + (df_x(x)).^2);
    a = 0; b = 3; n = 3 ; l = 20; format long;
    ans = cuad_gauss_c(r_x,a,b,l,n)
    disp("ahora para l+i")
    for i = 1 : 20
        cuad_gauss_c(r_x,a,b,l+i,n)
    endfor
end
