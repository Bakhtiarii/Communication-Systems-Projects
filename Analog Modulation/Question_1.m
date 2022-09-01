Ac = 1 ;     mu = 0.85 ;      fc = 250 ;
xm = [] ;    t0 = 0.15 ;
time = -0.2:0.0018:0.2 ;
for t = -0.2:0.0018:0.2               %calculate xm(t)
    if (t>=0 && t<(t0/3))
        xm(end + 1) = 1 ;
    end
    if (t>=(t0/3) && t<(2*t0/3))
        xm(end + 1) = -2 ;
    end  
    if (t<0 || t>=(2*t0/3))
        xm(end + 1) = 0 ;
    end
end
%% part A
xc = modulation_AM(xm , Ac , mu , fc) ;
%plot modulated signal
plot(time,xc) ;
title('modulated signal "xc" ')  
xlabel('time(s)');
%% part B
Length_xm = length(xm) ;           % Length of signal
Maximum_xm = max(abs(xm)) ;
xm = xm./Maximum_xm ;
Fs = ( -Length_xm/2 : Length_xm/2 -1) ;
%plot fourier transforms
figure;
subplot(1,2,1);
X_c = fft(xc) ;
plot(Fs,abs(X_c)) ;
title('Spectrum of "Xc"')
xlabel('frequency(Hz)');
subplot(1,2,2);
X_m = fft(xm) ;
plot(Fs,abs(X_m)) ;
title('Spectrum of "Xm"')
xlabel('frequency(Hz)');
%% part C
fun_1 = @(w) w-w+0.25 ;           %fun_1 is (0.5)*(0.5)
fun_2 = @(q) q-q+1 ;              %fun_2 is   (1)*(1)
Sx = (1/t0) * (integral(fun_1,0,0.05) + integral(fun_2,0.05,0.1)) ;    %Sx is the power of input signal ( xm(t) )
P_sidebands = (Ac^2)*(mu^2)*Sx/2 ; 
P_carrier = (Ac^2)/2 ;
power = P_sidebands + P_carrier ;
modulation_efficiency = (P_sidebands/power)*100 ;