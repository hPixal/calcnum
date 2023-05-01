function point = hacerCuestionario1()
  figure(1);
  f= @(x) (x./(1-x)).*sqrt((2*pt)./(2+x))-K
t = linspace(-10,10,100);
plot(t, f(t), '-m');
hold on
y = @(t) t.*0;
grid on;
grid minor;
plot(t,y(t),'-k');
[10:25]




  end
