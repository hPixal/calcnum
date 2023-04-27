function resultado = rcubica(numero)
    f = @(x) (x.^3 - numero);
    resultado = metodoBiseccion(f,0,numero,10000,0.0000001, 0.001);
    v = f(0:0.5:10);
    plot(v)
    hold on;
    hold off;
end
