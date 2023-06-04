# funcion a evaluar
f = @(x)(log(x));

# 3 puntos y pesos gaussiamos
t = [-sqrt((3-2*sqrt(6/5))/7),-sqrt((3+2*sqrt(6/5))/7),sqrt((3-2*sqrt(6/5))/7),sqrt((3+2*sqrt(6/5))/7)]; % nodos
w = [ (18+sqrt(30))/36, (18-sqrt(30))/36, (18+sqrt(30))/36 ,(18-sqrt(30))/36]; % pesos
% mapeamos nodos gaussianos al [a,b]
a = 1; b = 3;
xab = (b+a+(b-a)*t)/2 %desde acá voy a tener t valores pero ahora mapeados
Igauss = 0.5*(b-a)*w*f(xab)'

%ahora verifico con el valor de integracion analítico
fa = @(x)(x*log(x) - x);  %esta es la F primitiva de la f que quiero integrar
valorintegralanalitica = fa(3) - fa(1)
irr = abs(Igauss - valorintegralanalitica)
