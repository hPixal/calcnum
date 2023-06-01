function dx = diff2D(f_x,h,x0)
    dx = (f_x(x0+h) - f_x(x0))/h;
end