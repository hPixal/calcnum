function condicion = esEDD(initMatrix)
    % Una matriz en diagonal dominante caundo
    % los elementos de la diagonal son más grandes
    % que el absoluto de la suma de los valores de los costados

    condicion = true;
    for j = 1 : length(initMatrix)
        acum = 0;
        for i = 1 :length(initMatrix)
            if i != j
                acum += abs(initMatrix(j,i));
            endif
        endfor

        if acum < abs(initMatrix(j,j))
            condicion = false;
            break;
        endif

    endfor

end