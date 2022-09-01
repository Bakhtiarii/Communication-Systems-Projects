function y = p3_fmm(x , Ac , fc , kf , fs)
    k = 1/fs ;
    l = length(x) ; 
    t = 0:k:k*(l-1) ;
    y = zeros(1,1) ;
    for t = 0:k:k*(l-1)
        a = round((t/k)+1) ;
        phi(a) = kf.*trapz(x(1:a))/fs/3*2-1 ;
        y(a) = Ac.*cos(2*pi*fc*t + 2*pi*phi(a)) ;
    end
end

% function y = p3_fmm(x , Ac , fc , kf , fs)
%     N = 100 ;
%     Integral = 0 ;
%     for Counter = 1:1:N
%         Integral = Integral + x(N) + x(N+1) ;
%     end
%     Integral = ((0.2-0)/(2*N)) * Integral ;
%     Phi = 2*pi*kf*Integral ;
%     y = p3_pmm(Phi , Ac , fc , 1 , fs) ;
%     
% end
