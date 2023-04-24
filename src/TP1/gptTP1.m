function resultados = gptTP1()
  gptA = [1 1 1 0 0; 2 -1 0 1 0; 3 1 0 0 -1; 0 1 0 -1 -1; 2 0 1 0 1];
  gptb = [2; -2; 3; 0; 1];

  det(gptA)
[L D U] = LDUdescTP1(gptA);
radioEspJacobi = max(abs(eig(-inv(D)*(L+U))))
radioEspSeidel = max(abs(eig(-inv(D+L)*U)))
radioEspSOR = max(abs(eig(inv(D+w*L)*((1-w)*D-w*U))))

end
