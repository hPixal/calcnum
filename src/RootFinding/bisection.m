function [point,it,t] = bisection(f_x,x0,x1,maxIt,tolX)
  it = 1;
  tic();

  point = 0.1;
  fa = f_x(x0);
  fb = f_x(x1);
  if sign(fa)*sign(fb) > 0
    error('No se cumple la regla de los signos y el TVN');
  endif

    while it < maxIt
      point = x0 + (x1-x0)/2;
<<<<<<< HEAD
      if  (x1-x0)/2 < tolX
=======
      if (x1-x0)/2 < tolX
>>>>>>> 18b3225e6f0c4134648f014628081aadbc4752c8
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
    plotFunction(f_x,x0-5,x1+5,100,1)
    plotDots([ f_x(point) point ], 1 );
    
end
