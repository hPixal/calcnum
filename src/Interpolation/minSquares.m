function bfit = minSquares(dots)
    %dots = [Y X ; Y1 X1 ;...; Yn Xn ]
    n = size(dots,1);
    _xy = 0;
    _x = 0;
    _y = 0;
    _x2 = 0;
    for i = 1 : n
        _y += dots(i,1);
        _x += dots(i,2);
        _x2 += dots(i,2)^2;
        _xy += dots(i,1)*dots(i,2);
    end

    _m = (n*_xy - _x*_y)/(n*_x2 - (_x)^2);
    _b = (_y - _m*_x)/n;

    bfit = [_m _b];

    % - THIS IS FOR PLOTTING PORPUSES - %
    plotPol(bfit,dots(1,2),dots(n,2),1,2);  %
    plotDots(dots,2);                   %
    % --------------------------------- %

end
