function pivotPos = getNextPivot(column)
   n = length(column);
   biggest = column(1,1);
   for i = 1 : n
     aux = column(i,1);
     if aux < biggest
       pivotPos = i;
       biggest = column(i,1);
     endif
   endfor
end
