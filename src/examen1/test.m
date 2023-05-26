clc;
format long;
f = @(x) x + (e.^(-10.*x.^2)).*cos(x);
df = @(x) 1 - cos(x).*20.*x.*(e.^(-10.*x.^2)) - sin(x).*e.^(-10.*x.^2);

x = linspace(-0.5,0,100);

plot(x,f(x),"-r");   %-0.5 a 0
hold on;
plot(x,df(x),"-g");

[p,it,r,t] = Newton(f,df,0,1e-6,1000);
it
[p,it,r,t] = Biseccion(f,-0.4,-0.3,1e-6,1000);
p
it
