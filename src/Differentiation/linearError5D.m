function err = linearError5D(df5_dx5,h,x0)
    err = (h^4)*(30)*df5_dx5(x0);
end