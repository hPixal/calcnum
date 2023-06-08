function res = ej4()
    f1_x = @(x) sin(pi*x);
    f2_x = @(x) 1/(1+x.^2);
    figure(1);
    hold on;
    %Tabla 1
    a = 0; b = 5;
    valorReal1 = 2/pi;
    for n = 2 : 13
        n
        calc =  intNCcompuesta(f1_x,a,b,1,n)
        aux = valorReal1 - calc
        plot(n,aux)
    endfor
    
    %Tabla 2
    a = -5 ; b = 5;
    valorReal2 = 2.746801534;
    for n = 2 : 12
        n
        calc = intNCcompuesta(f2_x,a,b,1,n)
        aux = valorReal2 - calc
        plot(n,aux)
    endfor
end