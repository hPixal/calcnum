function [L,U,it,t]  = LUfactorizationNO_IPV(initialMatrix)
    tic();
    it = 1;
    n = length(initialMatrix);
    U = initialMatrix;
    L = eye(n);

    for j=1:n-1
        for i=(j+1):n
            U(i,:)=U(i,:)-(U(i,j)/U(j,j)).*U(j,:);
            it++;
        end
    end

    for i=2:n
        L(i,1)=initialMatrix(i,1)/U(1,1);
        it++;
    end

    for i=3:n
        for j=2:i-1
            L(i,j)=initialMatrix(i,j);
            for k=1:j-1
                L(i,j)=L(i,j)-L(i,k)*U(k,j);
                it++;
            end
            L(i,j)=L(i,j)/U(j,j);
        end
    end

    t = toc();
end
