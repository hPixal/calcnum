function y = plotFunction(f_x,a,dx,b) %a = Principio del rango | dx = paso | b = final del rango 
   figure(1);
   
   y = f_x(a:dx:b);
   x = linspace(a,dx,tamano)

   figure(2)
   plot(x,y,"-r")
   grid on
   grid minor
   title("Gráfica de la función")
   hold off
end