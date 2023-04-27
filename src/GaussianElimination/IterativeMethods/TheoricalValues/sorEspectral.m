function sorER = sorEspectral(initialMatrix,w) %w is the relaxation parameter
    [L D U] = LDUdescTP1(initialMatrix);
    soER = max(abs(eig(inv(D+w*L)*((1-w)*D-w*U))))
end
