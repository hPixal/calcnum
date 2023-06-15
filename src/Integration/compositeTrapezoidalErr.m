function err = compositeTrapezoidalErr(df2,a,b,L)
    err = -((b - a)^3 / (12 * L^2)) * df2((b-a)/2)
end