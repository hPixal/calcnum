function dx = diff2D(f_x,h,x0)
    dx = (1/(12*h))*(f(f-2*h) - 8*f(x-h) + 8*f(x+h) - f(x+3*h));
end