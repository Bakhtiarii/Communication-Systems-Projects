xm = [] ;
Fs = 600 ;          
Ts = 1/Fs ;          % Sampling period
time = -1:Ts:1 ;
frequency = -600:600 ;
for t = -1:Ts:1                      %calculate xm(t)
    if (t>=0 && t<=1)
        xm(end + 1) = sinc(10*t) ;
    else
        xm(end+1) = 0 ;
    end
end
figure;
subplot(1,2,1);
%plot input signal
plot(time,xm) ;
title(' "xm" ') 
xlabel('time(s)');
subplot(1,2,2);
X_m = fft(xm) ;
%plot fourier transforms
plot(frequency,abs(X_m)) ;
title('Spectrum of "Xm"')
xlabel('frequency(Hz)');
%% part A
fc = [10 , 50 , 100 , 600 , 1200] ;
for counter = 1:5
    y = modulation_DSB(xm , 1 , fc(counter)) ;
    figure;
    %plot modulated signal
    plot(time,y) ;
    title(['','fc = ',num2str(fc(counter))])
    xlabel('time(s)');
end   
%% part B
xc = modulation_DSB(xm , 1 , fc(3)) ;             % fc(3) = 100 Hz
X_c = fft(xc) ;
figure;
%plot fourier transforms
plot(frequency,abs(X_c)) ;
title('Spectrum of "X_c" , frequency = 100 Hz')
xlabel('frequency(Hz)');
%% part D
y = modulation_DSB(xc , 2 , fc(3)) ;
Y = fft(y) ;
figure;
subplot(2,2,1);
plot(frequency,abs(Y)) ;
title('Spectrum of "Y(f)"')
xlabel('frequency(Hz)');
subplot(2,2,2);
plot(time,y) ;
title('y(t)')
xlabel('time(s)');

Z = [] ;                        %Make a low-pass filter
for i = 1:1201
    if(i<300 || i>500)
        Y(i) = 0 ;
    end
end
for j = 1:1201
    if(j>299 && j<501)
        Z(j+200) = Y(j) ;
    end
    if(j>0 && j<500)
        Z(j) = 0 ;
    end
    if(j>700 && j<1202)
        Z(j) = 0 ;
    end
end
Z = Z*2 ;
z = ifft(Z) ;
figure;
subplot(3,2,1);
plot(frequency,abs(Z)) ;
title('Spectrum of "Z(f)"')
xlabel('frequency(Hz)');
subplot(3,2,2);
plot(time,z) ;
title('z(t)')
xlabel('time(s)');
%plot 'xc' , 'z' together
figure;
plot(time,z) ;
hold on
plot(time,xc) ;
hold off
title('together')
%calculate Mean Square Error
MSE = [] ;                  
MSE_tot = 0 ;
for n = 1:1201
    MSE(n) = (xc(n)-z(n))^2 ;
    MSE_tot = MSE_tot + MSE(n) ;
end
MSE = abs(MSE./n) ;
MSE_tot = abs(MSE_tot / n) ;
%% part E
Fc = -500:500 ;
New_MSE = [] ;
for q = 100:1100
    New_MSE(q-99) = MSE(q) ;
end
figure;
%plot MSE
plot(Fc,New_MSE) ;
title('MSE')
xlabel('frequency(Hz)');