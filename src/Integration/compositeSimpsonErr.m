function err = compositeSimpsonErr(df4,a,b,L)
 err = -((b - a)^5 / (180 * L^4)) * df4'((b-a)/2)
end