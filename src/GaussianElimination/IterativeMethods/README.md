# FUNCIONES QUE SIRVEN:
número de condición: cond(A)
norma de la matriz: norm(A)

# MÉTODOS DIRECTOS:

**NOTA** : Por favor miren el sentido de las flechas, no son doble implicación varias, y es importante tener esto en cuenta para justificar divergencia. En los informes tienen que sacar
## Gradiente Conjugado:
Si la matriz A tiene rango r, converge a lo sumo en r iteraciones.
Es eficiente si el número de condición es bajo (~1). Sino converge lento.

# MÉTODOS ITERATIVOS:
Un MI converge si ||T|| < 1 (norma de la matriz de iteración).
Un MI converge si p(T) < 1 (radio espectral de la matriz de iteración).
Converge más lento a medida que tiende a 1. Si tiende a 0, converge rápido.

## Jacobi: 
-  Si la matriz es diagonalmente dominante --> Jacobi converge para cualquier x0. (OJO CON EL SENTIDO DE LA FLECHA, NO ES DOBLE IMPLICACIÓN)

Use jacobiEspectral.m para checkear si el radio espectral es menor que 1

## Gauss-Seidel
-  Si la matriz es diagonalmente dominante --> G-S converge.
-  Si la matriz es simétrica definida positiva --> G-S converge.

Use gaussSeidelEspectral.m para ver si su radio de convergencia es menor que uno.

## SOR:
Si w = 1, SOR -> Gauss-Seidel

Si es definida postivia y simetrica se puede obtener un W optimo con **optimalW.m**

Use **sorEspectral.m** para determinar el radio de convergencia de SOR

