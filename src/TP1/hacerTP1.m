function resultados = hacerTP1(tamano)
  format long;
  [matrizFinal, vectorInicial , vectorDeExpansion] = iniciarCondicionesTP1(tamano);
  [L D U] = LDUdescTP1(matrizFinal);
  tolerancia = 1e-6;
  maxIt = 15000;

  display("Condiciones iniciales");
  display("Matriz Final")
  matrizFinal
  display("Vector Inicial")
  vectorInicial
  display("Vector de Expansion");
  vectorDeExpansion
  display("w optimo")

  [vectorFinalGauss,iteraciones,tiempo] = gaussTP1(matrizFinal , vectorDeExpansion');
   display("Gauss performance \n")
   tiempo
   iteraciones
   vectorFinalGauss

  [vectorFinalJacobi,iteraciones,tiempo,restJacobi] = myJacobiTP1(matrizFinal, vectorDeExpansion' , vectorInicial' , maxIt, tolerancia);
   display("Jacobi performance \n") %initialMatrix, equalVector, initialVector, maxIt, tolerance
   radioEspJacobi = max(abs(eig(-inv(D)*(L+U))))
   tiempo
   iteraciones
   vectorFinalJacobi

  w = 2/(1+sqrt(1-radioEspJacobi^2));

  [vectorFinalSeidel,iteraciones,tiempo,restSeidel] = myGauss_SeidelTP1(matrizFinal, vectorDeExpansion' , maxIt , tolerancia , vectorInicial' );
   display("Gauss-Seidel performance \n")
   radioEspSeidel = max(abs(eig(-inv(D+L)*U)))
   tiempo
   iteraciones
   vectorFinalSeidel

  [vectorFinalSOR,iteraciones,tiempo,restSOR] = SORMethodTP1(matrizFinal, vectorDeExpansion' , maxIt , tolerancia , vectorInicial' ,w );
   display("SOR performance \n")
   radioEspSOR = max(abs(eig(inv(D+w*L)*((1-w)*D-w*U))))
   tiempo
   iteraciones
   vectorFinalSOR

  %Grafica de la Convergencia

   figure(1)
   semilogy(restJacobi,"-r")
   hold on
   grid on
   hold on
   semilogy(restSeidel,"-g")
   semilogy(restSOR,"-b")
   title("Grafica de la convergencia de los metodos")
   hold off

   %Grafica de las Soluciones

   g = linspace(0,1,tamano)
   figure(2)
   plot(g,vectorFinalSOR,"-b",g,vectorFinalGauss,"-g",g,vectorFinalJacobi,"-r",g,vectorFinalSeidel,"-m")
   grid on
   grid minor
   title("Soluciones del sistema")
   hold off
end



