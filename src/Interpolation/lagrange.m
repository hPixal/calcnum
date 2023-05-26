function finalPol = lagrange(dotsVector)
    %dotsVector must be size x=2 y=n and equalValues size x = 1 y = n
    %dotsVector is a vector of points formated (Y,X)
    %for example dotsVector=[ 2 1 ; -3 2 ; 5 3 ; 3 4 ];

    n = length(dotsVector');
    pols(1:n) = {0};

    % - THIS IS FOR PLOTTING PORPUSES - %
    x1 = dotsVector(1,2);               %
    x2 = dotsVector(n,2);               %
    % --------------------------------- %

    for i = 1 : n
        init = i+1;
        if init > n
            init = 1;
        endif
            auxPoly(1,1) = 1; auxPoly(1,2) = -dotsVector(init,2);
            auxPoly = auxPoly / (dotsVector(i,2)-dotsVector(init,2));

        for j = init+1 : n
            if(j != i)
                auxPoly = conv(auxPoly(1,:),[1 -dotsVector(j,2)]);
                auxPoly = auxPoly/(dotsVector(i,2)-dotsVector(j,2));
            endif
        endfor

        if init > 2
            for k = 1 : i
                if(k != i)
                    auxPoly = conv(auxPoly(1,:),[1 -dotsVector(k,2)]);
                    auxPoly = auxPoly/(dotsVector(i,2)-dotsVector(k,2));
                endif
            endfor
        endif

        auxPoly(1,:) = auxPoly(1,:)*dotsVector(i,1);
        pols{i} = auxPoly(1,:)

        plotPol(auxPoly,x1,x2,i,1);
        clear auxPoly;
    endfor

    finalPol = pols{n};
  for i=n:-1:2
    pols{i-1} = [zeros(1, max(0, numel(pols{i})-numel(pols{i-1}))), pols{i-1}];
    finalPol = finalPol+pols{i-1};
  endfor

  e = 1e-8;
  for i = 1 : length(finalPol)
     if abs(finalPol(i)) < e
       finalPol(i) = 0;
     endif
  endfor


    % - THIS IS FOR PLOTTING PORPUSES - %
    plotPol(finalPol,x1,x2,1,2);        %
    plotDots(dotsVector,2);             %
    plotDots(dotsVector,1);             %
    % --------------------------------- %
end
