function weights = simpsonWeight(n)
    if rem(n,2) ~= 0
        error("n is not even");
    else
        weights(1:n) = 2;
        weights(2:2:n) = 4;
        weights(1) = 1;
        weights(n+1) = 1;
    endif
end
