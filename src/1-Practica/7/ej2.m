function s = ej2()

    t0 = 0; tF = 2; y0 = 0;
    L = 1:6; L = 10*2.^L;

    f = @(t,y) -y + sin(t) + cos(t);
    for i = 1 : length(L)
        [t1,y1] = euler(f,t0,tF,y0,L(i));
        [t2,y2] = rk2(f,t0,tF,y0,L(i));
        [t3,y3] = rk4(f,t0,tF,y0,L(i));

        tabla1(:,1) = t1(:);
        tabla1(:,2) = y1(:);
        tabla2(:,1) = t2(:);
        tabla2(:,2) = y2(:);
        tabla3(:,1) = t3(:);
        tabla3(:,2) = y3(:);

        printf "Valor euler para L= \n"
        tabla1(end,end)
        printf "Valor rk2 para L= \n"
        tabla2(end,end)
        printf "Valor rk4 para L= \n"
3        tabla3(end,end)

        clear t1 t2 t3 y1 y2 y3 tabla1 tabla2 tabla3;
    endfor





end
