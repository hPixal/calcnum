# Funciones Splines
Concepto se trata de hacer una funcion que intente solucionar el problema de que haya un polinomio que se vaya muy al carajo cuando los puntos estan muy separados. La idea es que se logre una curva más continua de lo que se lograria usando polinomios de lagrange. Ya que un polinomio de lagrange usa polinomios de grado mayor.

Spline usa polinomios de grado menr para poder trazar, uno puede decirle a la funcion spline el grado del polinoio con el que aproximar.  
LO piola de spline es que sea como más suave entre puntos, pero el problema de spline es que al ser de grado 1 lo que ocurre en un spline con en los puntos es que se pierde la derivada. Ya que se se hacen polinomios de grado 1 vamos a tener un punto anguloso y por tanto no va a haber derivada.
La solucion de esto son los splines cubicos, estas funciones poseen continuidad hasta la dervidad segunda. Ese es el oncepto que vamosa utilizar para contruir los splines cubicos.

Los polinomios cubicos tienen 4 coeficientes, por lo tanto estas van a ser mis incognitas. 
Si los polinomios del spline son Si y se ubican entre medio del intervalo Xi y X(i+1)
las condiciones para si sean
* S_i(x_I) = f(X_I)
* S_i-1(X_i) = S_i(X_i)
* S_i(X_i) =

Se le pide a S_(i-1) curvatura 0 es decir segunda derivada 0 cuando toca el limite del intervalo
Se le pide a S_i y S_(i-1) que su primer dervidad sea 0 en ambos puntos.