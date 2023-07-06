clc;clear all; close all;
f = @(x) [-2./x, 2./(x.^2), sin(log(x))./(x.^2)];
inter = [1; 2];
yc = [1; 2];
h = 0.1;
L = (inter(2)-inter(1))/h
[x1,y1]=dif_fin_dir(f,inter,yc,L)


h = 0.01;
L = (inter(2)-inter(1))/h
[x2,y2]=dif_fin_dir(f,inter,yc,L)


c2 = 1/70*(8-12*sin(log(2))-4*cos(log(2)));
c1 = 11/10-c2;
y = @(x) c1.*x + c2./(x.^2)-3/10*sin(log(x))-1/10*cos(log(x));

e1 = abs(y(x1)-y1);
e2 = abs(y(x2)-y2);

figure(1)
subplot(2,1,1)
plot(x1,e1)
title('Error h=0.1')

figure(1)
subplot(2,1,2)
plot(x2,e2)
title('Error h=0.01')
