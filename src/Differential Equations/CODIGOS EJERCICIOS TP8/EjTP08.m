#EjTP08.m
clear all; clc

f =@(x) [0*x 0*x-5 100*x.*(1-x)];
%f =@(x) [0*x  0.5  -0.5*20];

inter = [0,10];
yc = [40 200];

L=50;

[xd,yd] = disparo_linealJJ(f,inter,yc,L)

figure(1)
plot(xd,yd,'b-*')
grid on
grid minor
