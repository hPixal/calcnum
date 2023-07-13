function [finalLerp, it, time] = lerp(dotsVector)
  it = 0; tic();
  %dotsVector must be size x=2 y=n and equalValues size x = 1 y = n
  %dotsVector is a vector of points formated (Y,X)
  %for example dotsVector=[ 2 1 ; -3 2 ; 5 3 ; 3 4 ];
  n = length(dotsVector');
  for i=1:1:n-1 % n-1 because i'm taking 2 dots at a time

    dot1 = dotsVector(i,:);
    dot2 = dotsVector(i+1,:);

    % 2 dots slope formula is (y_2 - y_1)/( x_2 - x_1)
    m = (dot1(1,1) - dot2(1,1))/(dot1(1,2) - dot2(1,2));

    % Point-slope is the general form y=m(x-x_1) + y_1
    % which arranged in a different way such that i can
    % store it in a vector : ( m * x , y_1 - m * x_1)
    finalLerp(i,1) = m;
    finalLerp(i,2) = dot1(1,1) - m * dot1(1,2);

    plotPol(finalLerp(i,:),dot1(1,2),dot2(1,2),it,1);
  endfor
  %plotDots(dotsVector,1);
end