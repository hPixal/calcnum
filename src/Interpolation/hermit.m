function coefs = hermit(dots)
    % dots is [  f' f x ; ... ]
    l = size(dots,2);
    h = size(dots,1);
    coefs(1:2*h+2) = 0;

    for i = 1 : h
        z(i) = dots(i,end);
        z(i+1) = dots(i+1,end);
        coefs(2*i-1) = dots(i,2)
        coefs(2*i) = dots(i,2)

        if i != 1
            
        endif
    endfor 

end