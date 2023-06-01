function err = linearError3D(dddf_dddx,h,x0)
    err = (h^2)*(1/6)*dddf_dddx(x0);
end