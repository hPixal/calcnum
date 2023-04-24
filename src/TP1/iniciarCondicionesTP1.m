function [matrizFinal, vectorInicial , vectorDeExpansion ] = iniciarCondicionesTP1(tamano)
  matrizFinal = (2*diag(ones(1,tamano),0)-1*diag(ones(1,tamano-1),1)-1*diag(ones(1,tamano-1),-1));
  matrizFinal(1,[1:2])=[1 0];
  matrizFinal(tamano,[tamano-1:tamano])=[0 1];

  vectorDeExpansion(1:tamano) = 1/(tamano^2);
  vectorDeExpansion(1) = 0;
  vectorDeExpansion(tamano) = 0;

  vectorInicial(1:tamano) = 0;
  w = optimalWTP1(matrizFinal);
end

