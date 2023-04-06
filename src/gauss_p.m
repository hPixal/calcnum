function [A] = gauss_p(A,b)
n = length(A(:,1));
  r = [1:n];
  epsilon =1e-9;
  for k = 1:n
    [pmax,p] = max(abs(A(r(k:n),k))); % Alt 126 viborita
    if pmax < epsilon
      disp(' los posible pivotes son nulos')
    endif
    p = p(1) + k-1;
    if p ~=k
      r([p,k]) = r([k,p]);
    endif
    P =eye(n)(r,:);

    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
    A(r(k+1:n),k+1:n) -= A(r(k+1:n),k)*A(r(k),k+1:n);
  endfor
end
