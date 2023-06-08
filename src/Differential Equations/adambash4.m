function [x, w] = adambash4(f, t0, tF, y0, L)
h = (tF-t0)/L;
x = [t0:h:tF];
w = zeros(1,L+1);
w(1) = y0;
w(2) = w(1) + h*f(x(1),w(1));
w(3) = w(2) + h*f(x(2),w(2));
w(4) = w(3) + h*f(x(3),w(3));
for i=4:L
f0 = f(x(i),w(i));
f1 = f(x(i-1),w(i-1));
f2 = f(x(i-2),w(i-2));
f3 = f(x(i-3),w(i-3));
  w(i+1) = w(i) + h/24*(55*f0 - 59*f1 + 37*f2 - 9*f3);
endfor
endfunction