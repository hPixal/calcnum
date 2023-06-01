function [a,b,c,d,stackOfFunctions]=cubicSpline(dotsVector)
    %my natural cubic spline
    dots(1,:) = dotsVector(:,1)';
    dots(2,:) = dotsVector(:,2)';
    n=length(dots(1,:));

    for i=1:n; 
        a(i)=dots(2,i); 
    end

    for i=1:n-1; 
        h(i)=dots(1,i+1)-dots(1,i); %extremo izquierdo
    end

    for i=2:n-1; 
        alfa(i)=3/h(i)*(a(i+1)-a(i))-3/h(i-1)*(a(i)-a(i-1)); %extremo derecho
    end

    l(1)=1; 
    mu(1)=0; 
    z(1)=0;

    for i=2:n-1; 
        l(i)=2*(dots(1,i+1)-dots(1,i-1))-h(i-1)*mu(i-1); 
        mu(i)=h(i)/l(i); 
        z(i)=(alfa(i)-h(i-1)*z(i-1))/l(i); 
    end

    l(n)=1; 
    z(n)=0; 
    c(n)=0;

    for i=n-1:-1:1; 
        c(i)=z(i)-mu(i)*c(i+1); 
        b(i)=(a(i+1)-a(i))/h(i)-h(i)*(c(i+1)+2*c(i))/3; 
        d(i)=(c(i+1)-c(i))/(3*h(i)); 
    end

    for i=1:n-1;  
        f_x= @(x) a(i)+b(i)*(x-dots(1,i))+c(i)*(x-dots(1,i)).^2+d(i)*(x-dots(1,i)).^3; 
        plotFunction(f_x,dots(1,i),dots(1,i+1),100,1); 
        stackOfFunctions(i) = f_x;
    end
    plotDots([dotsVector(:,2) dotsVector(:,1)],1);
end
