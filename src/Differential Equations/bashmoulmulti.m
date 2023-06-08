function [t,y] = bashmoulmulti(f,t0,tF,y0,L)
#recibimos la función "f", los puntos en los que la evaluamos "t", y la condicion inicial y0

t = linspace(t0,tF,L+1)';
h = (tF-t0)/L;

% reservamos lugar en memoria para y
y = zeros( length(y0), L+1 );

y(:,1) = y0;

for n=1:3
  k1 = h * f(t(n)  , y(:,n));
  k2 = h * f(t(n)+h/2, y(:,n)+k1/2);
  k3 = h * f(t(n)+h/2, y(:,n)+k2/2);
  k4 = h * f(t(n+1), y(:,n)+k3);

  y(:,n+1) = y(:,n) + (k1+2*k2+2*k3+k4)/6;
endfor
#Como runge kutta calculo los primeros 3 valores, arrancamos desde n = 4

for n=4:L
  #Adams bashfort predictor 4 pasos
  y(:,n+1) = y(:,n) + (h/24) * (55*f(t(n),y(:,n))...
  -59*f(t(n-1),y(:,n-1))...
  +37*f(t(n-2),y(:,n-2))...
  -9*f(t(n-3),y(:,n-3)));

  #Adams moulton corrector 3 pasos
  y(:,n+1) = y(:,n) + (h/24)*(9*f(t(n+1),y(:,n+1))...
  +19*f(t(n),y(:,n))...
  -5*f(t(n-1),y(:,n-1))...
  +f(t(n-2),y(:,n-2)));

endfor
  y = y';
  y = y(:,1);
endfunction
