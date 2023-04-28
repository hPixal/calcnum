function [finalLagrange, it, time] = nInterpolation(dotsVector)

  %dotsVector must be size x=2 y=n and equalValues size x = 1 y = n
  %dotsVector is a vector of points formated (Y,X)
  %for example dotsVector=[ 2 1 ; -3 2 ; 5 3 ; 3 4 ];

  tic();
  n = length(dotsVector');
  it = 1;

  % The following is for plotting porpuses, can be ignored.
  x1 = dotsVector(1,2);
  x2 = dotsVector(n,2);

  % stackOfLagranges will acumulate the lagrange polynomials
  % to sum them all at the end to get finalLagrange.
  stackOfLagranges(1:n,1) = {0};


  for i = 1 : n

    % I look after making the initial lagrange polynomial
    % wich will be a grade 1 pol. initLag porpuse is to
    % avoid making the same pol in the second for loop.
    initLag = i+1;
    if i+1 < n
      buildingDot = dotsVector(i+1,:);
    else
      buildingDot = dotsVector(1,:);
      initLag = 1;
    endif

    % after selecting the
    lagrangePoly = [ 1 (-1)*buildingDot(1,2) ];

    for j = 1 : 1 : n

      if dotsVector(j,2) != dotsVector(i,2)
        auxPoly = [ 1 (-1)*dotsVector(j,2) ];


        % the following would do auxPoly*lagrangePoly
        % in a way that if lagrangePoly is (x - a)*(x - b)
        % and auxPoly is (x - c) the result would be
        % lagrangePoly = ( x - a )*( x - b )*( x - c )
        lagrangePoly = conv(lagrangePoly, auxPoly);
      endif
      it += 1;
    endfor

    % now i have a polynomial which is zero in all the
    % values of x that are **NOT** the building dot.
    % But now i need the polynomial to be equal to
    % y = dotsVector(i,1) in x = dotsVector(i,2)
    % so if my polynomial is equal to c in x = dotsVector(i,2)
    % i'll need to multiply it by dotsVector(i,1)/c
    multiplier = dotsVector(i,1)/polyval(lagrangePoly,dotsVector(i,2));

    % Debugging
    % dotsVector(i,1)
    % dotsVector(i,2)
    % multiplier
    lagrangePoly = lagrangePoly*multiplier;

    % this is for plotting porpuses, can be ignored
    plotPol(lagrangePoly,x1,x2,i,1);

    % now that i have my lagrangePoly complete and working
    % i'll add it to the pile of lagrangePolys
    stackOfLagranges{i,1} = lagrangePoly;
    it += 1;
  endfor

  % to get finalLagrange i must sum all polys. They all
  % must have the same size to be summed up so, the next
  % for loop porpuse it's to ensure that and to sum them.
  finalLagrange = stackOfLagranges{n,1};
  for i=n:-1:2
    stackOfLagranges{i-1,1} = [zeros(1, max(0, numel(stackOfLagranges{i,1})-numel(stackOfLagranges{i-1,1}))), stackOfLagranges{i-1,1}];
    finalLagrange = finalLagrange+stackOfLagranges{i-1,1};
    it += 1;
  endfor

  % this is for plotting porpuses, can be ignored
  plotPol(finalLagrange,x1,x2,1,2);
  plotDots(dotsVector,2)
  plotDots(dotsVector,1)
  t = toc();
end
