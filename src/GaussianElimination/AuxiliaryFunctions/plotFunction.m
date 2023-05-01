function y = plotFunction(f_x,a,b) %a = Principio del rango | dx = paso | b = final del rango

   figure(1)

   x = linspace(-10,10,100);
   y = f_x(x);

   figure(2)
   plot(x,y, '-r');
   hold on;
   hold off
end
