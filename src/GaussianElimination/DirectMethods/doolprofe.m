function[L, U, P]=doolprofe(U)
  n = length(U);
  L = zeros(n);
  r = 1:n;
  for k=1:n
    [~,p] = max(abs(U(r(k:n),k)));
    p = p(1) + k - 1;
    r([k,p]) = r([p,k]);
    L(k+1:n,k) = U(r(k+1:n),k) / U(r(k),k);
    U(r(k+1:n),k:n) -= L(r(k+1:n),k) * U(r(k),k:n);
  end
  U = U(r,: );
  L = L(r,: ) + eye(n);
  P = eye(n)(r,: );
endfunction
