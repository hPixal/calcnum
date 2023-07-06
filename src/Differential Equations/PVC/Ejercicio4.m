f = @(x) [-2./x 2./x.^2 sin(log(x))./x.^2];
%y(1)=1 y(2)=2
inter = [1 2];
ycd = 1;
%b = 2
rob = [0 1 2];
L = 10;
[x,y]=dif_fin_rob(f,inter,ycd,rob,L)
figure(1)
plot(x,y,'-m')
hold on

%ycd es alpha, el valor de la funcion en y(a)
%rob es el vector que tiene A, B y C.
%L es b-a/h; como h = 0.1 y h=0.01,en est4e caso tengo que hacer
%L = 10 y L=100

L = 100;
[x,y]=dif_fin_rob(f,inter,ycd,rob,L)
plot(x,y,'-g')
