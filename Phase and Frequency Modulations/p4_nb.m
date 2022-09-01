function y = p4_nb(x , Ac , fc , kp , fs)
    t = 0 : 1/fs : (1/fs)*(length(x)-1) ;
    y = Ac*cos(2*pi*fc*t) - Ac*kp*x.*sin(2*pi*fc*t) ;
end




% function y = p4_nb(x , Ac , fc , kp , fs)
%     t = 0 : 1/fs : 0.2 ;
%     y = Ac*cos(2*pi*fc*t) - Ac*kp*x.*sin(2*pi*fc*t) ;
% end
