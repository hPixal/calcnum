function [point,it,t] = bisection(f_x,x0,x1,tolX,maxIt)
  it = 1;
  tic();

  point = 0;
  fa = f_x(x0);
  fb = f_x(x1);
  if sign(fa)*sign(fb) > 0
    error('No se cumple la regla de los signos y el TVN');
  endif

    while it < maxIt
      point = x0 + (x1-x0)/2;

      if  abs(x1-x0)/2 < tolX || f_x(point) == 0
        break;
      endif

      if (sign(f_x(point))*sign(f_x(x1)) < 0)
        x0 = point;
      else
        x1 = point;
      endif

      it = it + 1;
    endwhile
    t = toc();
    dx = abs(x0-x1);
    plotFunction(f_x,x0-5*dx,x1+5*dx,100,1)
    plotDots([ f_x(point) point ], 1 );
    
end
