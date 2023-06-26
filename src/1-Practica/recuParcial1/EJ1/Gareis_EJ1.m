function res = Gareis_EJ1()
  [A,b,x0] = iniciarMatriz(3);
  disp("Octave: ")
  A\b'
  [A,L,U,P,Z,Z1] = doolittle_p(A);
  disp("Mi doolittle: ")
  L 
  U
  P
  disp("Doolittle del ejercicio: ")
  [M,P]= Doolittle(A)
  M
  P
  disp("LAS DOS MATRICES: ")
  M 
  
  U
  L
end