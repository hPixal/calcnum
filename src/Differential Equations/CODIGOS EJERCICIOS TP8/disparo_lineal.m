function [x,y] = disparo_lineal(f,inter,yc,L)
  
  p = @(x) f(x)(:,1);
  q = @(x) f(x)(:,2);
  r = @(x) f(x)(:,3);
  a=inter(1);
  b=inter(2);
  F = @(x,y) [y(3);
              y(4);
              p(x)*y(3) + q(x)*y(1) + r(x);
              p(x)*y(4) + q(x)*y(2) + r(x)];
              
  y0 = [yc(1); yc(1); 0;1]
  %[x,yi] = RungeKuttaMulti(F,a,b,y0,L) 
  [x,yd]=rk4(F, inter, y0, L);
  lambda = (yc(2)-yd(end,2))/(yd(end,1)-yd(end,2));
  y = lambda*yd(:,1)+(1-lambda)*yd(:,2);
endfunction
