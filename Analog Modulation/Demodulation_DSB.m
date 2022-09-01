%% part C
function z = Demodulation_DSB(xc , Ac , fc)
    t = -1 : 1/600 : 1 ;
    y = 2*Ac*xc.*cos(2*pi*fc*t) ;
    z = lowpass(y,fc,600) ;        % lowpass does not work in 'R2016a'
end


