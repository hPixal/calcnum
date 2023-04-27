function gaussSeidelER = gaussSeidelEspectral(initialMatrix) 
    [L D U] = LDUdescTP1(initialMatrix);
    gaussSeidelER = max(abs(eig(-inv(D+L)*U)))
end
