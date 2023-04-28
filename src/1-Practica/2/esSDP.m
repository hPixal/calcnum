function condicion = esSDP(initMatrix)
    % Una matriz es simetricamente definida positiva si 
    % es simetrica y todos sus eigenvalores son mayores
    % que cero
    tf = issymmetric(initMatrix);
    d = eig(initMatrix);
    condicion = all(d > 0) && tf;
endfunction
