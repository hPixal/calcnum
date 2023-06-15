function e = practExam()
    t = 0:6
    cant = [ 432 599 1012 1909 2977 4190 5961 ]
    plotDots([cant' t'],1);
    p = polyfit(t,cant,4);
    cotaErrorList(cant,p,t)
    p_t = @(t) polyval(p,t);
    abs(p_t(10) - 14900)/14900
end