function sonIguales = ej2()
    %parte a
    dotsVector = [ 1.2 3 ; 1.7 5 ; 2.0 7 ; 2.1 9];
    pol1 = lagrange(dotsVector)
    pol2 = dividedDiff(dotsVector)
    sonIguales = pol1 == pol2 

    %parte b
    
end