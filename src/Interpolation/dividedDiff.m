function endPol = dividedDiff(dots)
    % In this lagorithm i'll get a interpolating polynomial by the
    % Newton dived difference method

    % dots must be size x=2 y=n and equalValues size x = 1 y = n
    % dots is a vector of points formated (Y,X)
    % for example dots=[ 2 1 ; -3 2 ; 5 3 ; 3 4 ];
    n = size(dots,1);

    x1 = dots(1,2);               %
    x2 = dots(n,2);

    pols(1:n) = {1};
    coef(1) = newtonCoef(dots(1,:));
    pols(1) = coef(1);
    for i = 2 : n
        coef(i) = newtonCoef(dots(1:i,:));
        for j = 1 : i-1
            aux = [1 -dots(j,2)];
            pols{i} = conv(pols{i},aux);
        endfor
        pols{i} = pols{i}*coef(i);
        plotPol(pols{i},x1,x2,i,1);
    endfor

    endPol = pols{n};
    for i=n:-1:2
        pols{i-1} = [zeros(1, max(0, numel(pols{i})-numel(pols{i-1}))), pols{i-1}];
        endPol = endPol+pols{i-1};
    endfor
     % - THIS IS FOR PLOTTING PORPUSES - %
    plotPol(endPol,x1,x2,1,2);        %
    plotDots(dots,2);             %
    plotDots(dots,1);             %
    % --------------------------------- %

end
