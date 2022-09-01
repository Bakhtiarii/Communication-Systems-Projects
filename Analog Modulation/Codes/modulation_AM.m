function y = modulation_AM(x , Ac , mu , fc)
    Length_x = length(x) ;       t = 0 : 0.001 : (Length_x - 1) / 1000 ;
    Maximum_x = max(abs(x)) ;    x = x./Maximum_x ;
    y = Ac*(1+mu*x).*cos(2*pi*fc*t) ;
end