# MÉTODOS DE NO LINEALES:
## Bisección:
Siempre converge globalmente pero lineal (lento).

## Punto fijo:
Si g es continua en [a,b] y existe g'(x) en (a,b) con |g'(x)| <= k < 1 y p0 en [a,b], converge al PF.
Mientras menor sea k, más rápido converge. Si k~1, converge lento.
Si |g'(p)| != 0, converge lineal.
Si |g'(p)| = 0, podría converger cuadrático.

## Newton-Raphson:
Si p es raíz simple, converge cuadrático. Si es raiz múltiple, converge lineal.
(raiz simple: f(p) = 0, f'(p) != 0 para f cont. deriv. en [a,b])
p0 tiene que estar cerca de p para converger (local), y regularidad en la derivada.
Dado un [a,b] tiene que darse f(a)*f(b)<0.

## Secante:
No converge siempre.

## Regula Falsi:
Converge globalmente (siempre).
