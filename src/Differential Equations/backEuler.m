function [t, y] = backEuler(f,t0,tF,y0,L)
    % Inicializar los vectores para almacenar los valores de tiempo y solución
    t = linspace(t0,tF,L+1)';
    h = (tF-t0)/L;
    y = zeros( length(y0), L+1 );
    y(1) = y0;

    % Iterar sobre los pasos de tiempo
    for i = 2:L+1
        % Calcular el siguiente valor de solución usando el método de Euler hacia atrás
        y(i) = y(i-1) + h * f(t(i), y(i-1));
    end
    y = y';
end
