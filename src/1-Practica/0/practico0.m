printf("this is a octave hello world \n \n");
% CN2023_TP0
% Ejercicio 1

printf("Ejercicio 1 \n \n");

a1 = 5^2 - 1/(2 ^ 3) - sqrt(3^2 + (2*2)^2);
a1
b1 = sin(pi/6) - atan(1/2);
b1
c1 = log(3 + 1/5) - e^2;
c1

% Ejercicio 2

printf("Ejercicio 2 \n \n");

function [y] = myFunction(x)
    y = sin(2*x) / ( x * (x + 1));
end;

myFunction((-4))
myFunction((-pi/8))
myFunction(sqrt(2)/4)
myFunction(pi/2)
myFunction(9*pi/5)
myFunction(0)
myFunction(-1)

% Ejercicio 3

printf("Ejercicio 3 \n \n");

a3 = [ 1 2 3 -4 ]
b3 = [ 1 2 3 -4 ]'
c3 = -2.5:0.5:1
d3 = ( -2.5:0.5:1 )'
e3 = [-3:2:4]

% Ejercicio 4

printf("Ejercicio 4 \n \n");

x = [ -0.5 7 2 ];
z = [ 2 -1 3 ]';

2*x
y = x-1

x.*y

y.^2

x' + 5*z

x+5*z

y-z'/3

v = [x,y]

v(2:5)

v(5:6)+(z(1:2))'

w = [x;y]

% Ejercicio 5

printf("Ejercicio 5 \n \n");

p = [ 2 3 4 7 ]

polyout(p,'x');
x = 3;
polyval(v,x)
roots(p)

% Ejercicio 6

printf("Ejercicio 6 \n \n ")

A = [1 2 3;4 5 6;7 8 9]

A

B = A'

B

C = [-3.2,5,7.4,6;4,17,-1.3,2.1;5.9,-6,0,4.5]

C

mat = C'
% Ejercicio 7

printf("Ejercicio 7 \n \n");

clearvars

m = 5
n = 4*m+1
x = linspace(0,1,n)
y = zeros(1,n)
a = x(1:m+1)
y(1:m+1) = sin(2*pi*a)
y(2*m+1:-1:m+2) = y(1:m)
y(2*m+2:n) = -y(1:2*m);

% Ejercicio 8

printf("Ejercicio 8 \n \n ")

function [y1] = myFunction2(x1)
    y1 = (((x1 + 1)./ (x1 .^ 2 + x1 +1 )) .^ 6).* (cos(x1) + 3)
end;

plot(x,y)

xF = (0:0.01:2);
yF = myFunction2(xF);

%plot(xF,yF);

clearvars

function [y1, y2] = myResolvente( a, b, c )
    y1 = ( -b + sqrt(b^2 - 4 * a * c))/ ( 2 * a);
    y2 = ( -b - sqrt(b^2 - 4 * a * c))/ ( 2 * a);
end;

x=[-1 0 1.5 2]; y=[3 2 2 0]; plot(x,y)

plot(x,y,'o')

x=linspace(0,2*pi,201);
y=sin(x);
plot(x,y)
hold on
z=cos(x);
plot(x,z,'k-.')
hold off
