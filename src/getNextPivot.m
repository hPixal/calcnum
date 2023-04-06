function pivotPos = getNextPivot(column,iniPos)
   n = length(column);
   pivotPos = iniPos;
   biggest = column(iniPos);
   [ a , b ] = max(column(iniPos:n));
     if a > column(iniPos)
       pivotPos = b + iniPos - 1;
     endif
end
