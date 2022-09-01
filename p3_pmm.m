function y = p3_pmm(x , Ac , fc , kp , fs)
    t = 0 : 1/fs : (1/fs)*(length(x)-1) ;
    y = Ac*cos((2*pi*fc*t)+(x.*kp)) ;
end


% function y = p3_pmm(x , Ac , fc , kp , fs)
%     t = 0 : 1/fs : 0.2 ;
%     y = Ac*cos((2*pi*fc*t)+(x.*kp)) ;
% end
