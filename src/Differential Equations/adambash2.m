function [t, w]=adambash2(f, t0, tF, y0, N)
h = (tF-t0)/N;
t = [t0:h:tF];
w = zeros(1,N+1);
w(1) = y0;
w(2) = y0 + h*f(t(1),y0);
for i=2:N
f0 = f(t(i),w(i));
f1 = f(t(i-1),w(i-1));
w(i+1) = w(i) + h*0.5*(3*f0 - f1);
endfor
endfunction