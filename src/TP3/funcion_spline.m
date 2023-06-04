function [S,dS]=funcion_spline(x1,y1,df1,df2)

    %la modifique un toque para que además grafique y
    %que defaultee df1 y df2 a 0 y haga un spline natural
    %si no le pasas esos parametros

    nargin

    if nargin < 3
        [a,b,c,d] = cubic_spline_natural(x1,y1);
    elseif nargin == 3
        [a,b,c,d] = cubic_spline_clamped(x1,y1,df1,df1);
    else
        [a,b,c,d] = cubic_spline_clamped(x1,y1,df1,df2);
    endif

    S=@(x) a(1)*(x==x1(1));

    M=[d c b a];
    dM=[];
    dS= @(x) 0;
    for i=1:length(x1)-1
        dM=[dM;polyder(M(i,:))];
        S=@(x) S(x) + polyval(M(i,:),x-x1(i)).*(x>x1(i)).*(x<=x1(i+1));
        dS=@(x) dS(x) + polyval(dM(i,:),x-x1(i)).*(x>x1(i)).*(x<=x1(i+1));
    endfor

    dots(:,1)=y1';
    dots(:,2)=x1';

    % - THIS IS FOR PLOTTING PORPUSES - %
    plotFunction(S,x1(1),x1(end),100,1);%
    plotDots(dots,1);                   %
    % --------------------------------- %

    % - THIS IS FOR PLOTTING PORPUSES -  %
    plotFunction(dS,x1(1),x1(end),100,2);%
    plotDots(dots,2);                    %
    % ---------------------------------  %

end
