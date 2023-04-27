function jacobiER = jacobiEspectral(initialMatrix) 
    [L D U] = LDUdescTP1(initialMatrix);
    jacobiER = max(abs(eig(-inv(D)*(L+U))))
end
