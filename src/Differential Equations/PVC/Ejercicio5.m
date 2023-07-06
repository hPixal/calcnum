%tengo dos condiciones de contorno en los extremos, pero la ed rige para todos los puntos, no solo
%en los contornos.
Long = 3;
k0 = 1;
%u(0) = 21;
%u'(3) = 0;
f2 = @(x) 20.*sin(5.*(x-1));
inter = [0; 3];
f = @(x) [0.*x 0.*x f2(x)./(-k0)];
ycd = 21;
rob = [-k0 0 0];
L = 3;
%[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
%y(end)
%L = L*2;
%[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
%y(end)
%L = L*2;
%[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
%y(end)
%L = L*2;
%[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
%y(end)
%L = L*2;
%[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
%y(end)
%L = L*2;
%[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
%y(end)
%L = L*2;
%[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
%y(end)
L = L*2^7;
[x,y]=dif_fin_rob(f,inter,ycd,rob,L);
y(end)
%La temperatura en el lado derecho de la barra es de 29.86 :)
plot(x,y)
[ymax i] = max(y);
x(i)
%la temperatura es maxima en el punto x = 2.77

