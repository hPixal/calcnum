function e = practExamen2()
    close all; clc;
    m = 10;
    c = 0.2; g = 9.81; L= 2;
    t0 = 0; tF= 2.5; y0 = 30;  uy0 = [30 0]; ux0 = [0 40];

    fy = @(t,uy) [ uy(2); (-g - c*uy(2)/m)]
    fx = @(t,ux) [ ux(2); (0 - c*ux(2)/m)]

    last = -999; current= 0;
    while abs(last - current) > 0.001
      last = current; L = L*2;
      [t,y] = rk4(fy,t0,tF, uy0, L);
      current = y(end,1);
    endwhile
    disp("hola");
    last = -999;
    while abs(last)  > 0.001
      tF-=0.000001;
      [t,y] = rk4(fy,t0,tF, uy0, L);
      last = y(end,1);
    endwhile
    %t0b = t0;
    %while  abs(y(end,1))  > 0.001
    %  point = t0b + (tF-t0b)/2;
    %  [t,y] = rk4(fy,t0b,tF, uy0, L);
%
    %    % Calculate the absolute differences
    %    differences = abs(t - point);
%
    %    % Find the index of the minimum difference
    %    [minDifference, index] = min(differences);
%
    %    % Get the closest element
    %    point = t(index);
%
    %      if  abs(tF-t0b)/2 < 0.001 || y(index,1) == 0
    %        break;
    %      endif
%
    %      if (sign(y(index,1))*sign(y(index,1)) < 0)
    %        t0b = t(index)
    %      else
    %        tF = t(index)
    %      endif
    %endwhile
    clear t;
    [t,x] = rk4(fx,t0,tF, ux0, L);
    [t,y] = rk4(fy,t0,tF, uy0, L);

    lerp([x(:,1) t],1);
    lerp([y(:,1) t],2);
    lerp([y(:,1) x(:,1)],3);

    L
    y(end,1)
    tF
end
