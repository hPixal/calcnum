function [t,y]=rk4(f,t0,tF, y0, L)
%function [t,y]=rk4(f, [T0 Tf], y0, L)
% Metodo de Runge-Kutta de orden 4 
% para resolver
%    y' = f(t,y)  en [t0,TF]
%    y(t0) = y0
% Usando L pasos
% y0 puede ser vectorial o escalar

t = linspace(t0,tF,L+1)'; 
h = (tF-t0)/L;

% reservamos lugar en memoria para y
y = zeros( length(y0), L+1 );

y(:,1) = y0;

for n=1:L
  k1 = h * f(t(n)  , y(:,n));
  k2 = h * f(t(n)+h/2, y(:,n)+k1/2);
  k3 = h * f(t(n)+h/2, y(:,n)+k2/2);
  k4 = h * f(t(n+1), y(:,n)+k3);

  y(:,n+1) = y(:,n) + (k1+2*k2+2*k3+k4)/6;
endfor

y=y';

end