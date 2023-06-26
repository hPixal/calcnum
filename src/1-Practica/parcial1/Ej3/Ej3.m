function  res = Ej3()
    err = 1e-6;
    [mF,vE,x0]=iniciarMatriz(39);
    [vF,r_h,it,t] = gaussSeidel(mF,vE,x0,1763,err);
    vF
    it
    vF(20)
end