function [x,it,t] = gauss(A,b)
n=length(A(1,:));
tic()
it = 1;
for it:n
m = A(k+1:n,k)/A(k,k);
b(k+1:n) = b(k+1:n) - m*b(k);
A(k+1:n,k:n) = A(k+1:n,k:n) - m*A(k,k:n);
endfor
x=sust_atras(A,b);
t = toc();
endfunction