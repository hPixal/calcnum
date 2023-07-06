function res = Ej5()
    f = @(x) [ 0.*x , 0.*x , -20*sin(5*(x-1))];
    %k0 = 1 
    ycd = 21;
    L = 10; tol = 0.0001
    inter = [ 0 3 ]; rob = [1 0 0]
    [x,y]=dif_fin_rob(f,inter,ycd,rob,L)
    yEnd = y(end,1);
    current = 0;
    clear y; clear x;
    while abs(yEnd-current) > tol
        yEnd = current; L*=2;
        [x,y]=dif_fin_rob(f,inter,ycd,rob,L);
        current = y(end,1)
    endwhile
    display("encontro")
    L = 20;
    [x,y]=dif_fin_rob(f,inter,ycd,rob,L)
    lerp([y x],1)
    yEnd 
end