function [mF, vE, x0] = iniciarMatriz(n)
    h = 1/n

    mF = (2*diag(ones(1,n),0)-1*diag(ones(1,n-1),1)-1*diag(ones(1,n-1),-1));
    mF(1,[1:2])=[1 0];
    mF(n,[n-1:n])=[0 1] 

    for i = 1 : n 
        vE(i) = (h^2)*(20)*e^(-10*(i*h-0.7)^2)
    endfor

    vE(1) += 5;
    vE(n) += 6;  

    vE = vE';
    x0(1:n,1) = 0;
    %%mF = zeros(n,n);
    %h = 1/n;
    %mF(1,1) = 2;
    %mF(1,2) = -1;
    %mF(n,38) = -1;
    %mF(n,n) = 2;
    % vE(1) = h^2*20*e^(-10*(h-0.07)^2)+5;
    % vE(n) = h^2*20*e^(-10*(1-h-0.07)^2)+6;
    %for i = 2:(n-1)
    %  vE(i) = h^2*20*e^(-10*((h*i)-0.07)^2)
    %  mF(i,i-1) = -1;
    %  mF(i,i) = 2;
    %  mF(i,i+1) = -1;
    %endfor
end

