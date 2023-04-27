function [point,it,t] = bisection(f_x,x0,x1,maxIt,tolX,tolY)
  it = 1;
  tic();

  fa = f_x(x0);
  fb = f_x(x1);
  if sign(fa)*sign(fb) > 0
    error('No se cumple la regla de los signos y el TVN');
  endif

    while it < maxIt
      point = x0 + (x1-x0)/2;
      if abs(f_x(point)) < tolY || (x1-x0)/2 < tolX
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
end
