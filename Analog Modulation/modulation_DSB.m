function y = modulation_DSB(x , Ac , fc)
    t = -1 : 1/600 : 1 ;
    y = Ac*x.*cos(2*pi*fc*t) ;
end
