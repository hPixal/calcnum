function [M,P]= Doolittle(A)
n = length(A);
  r = 1:n;
  for k=1:n
    [~,p] = max(abs(A(r(k:n),k)));
    p = p(1) + k - 1;
    r( [k,p] ) = r( [p,k] );
    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
    A(r(k+1:n),k+1:n) -= A(r(k+1:n),k)*A(r(k),k+1:n);
  endfor
  M = A(r,: );
  P = eye(n,n)(r,: );
endfunction