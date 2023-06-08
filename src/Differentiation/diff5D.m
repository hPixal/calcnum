function dx = diff5D(f,h,x0)
    dx = (1/(12*h))*(f(x0-2*h) - 8*f(x0-h) + 8*f(x0+h) - f(x0+3*h));
end
