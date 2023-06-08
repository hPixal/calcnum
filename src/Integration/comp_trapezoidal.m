function s = comp_trapezoidal(f,a,b,n)
x = linspace(a,b,n+1);
s = (f(a)+f(b))/2;
s = s + sum(f(x(2:1:n)));
s = s*(b-a)/n;
end