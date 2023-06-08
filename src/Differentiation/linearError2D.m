function err = linearError3D(ddf_ddx,h,x0)
    err = abs((h)*(1/2)*ddf_ddx(x0));
end