%% Part_1
J = [] ;
Z = [0 : 0.1 : 10] ;
hold on
for nu = 1:5                      %calculate J and plot
    J = besselj(nu,Z) ;
    plot(Z,J) ;
end
title(' Bessel (first kind) ')  
xlabel('X');
ylabel('J');
% grid on
% legend('J_1','J_2','J_3','J_4','J_5','Location','Best')
hold off
%% Part_2
Y = [] ;
Z = [0 : 0.1 : 10] ;
hold on
for nu = 1:5                      %calculate Y and plot
    Y = bessely(nu,Z) ;
    plot(Z,Y) ;
    axis([0 10 -2 0.7])
end
title(' Bessel (second kind) ')  
xlabel('X');
ylabel('Y');
grid on
legend('Y_1','Y_2','Y_3','Y_4','Y_5','Location','Best')
hold off
%% Part_5_6_7
fs = 10000 ;
Ts = 1/fs ;          % Sampling period
time = 0:Ts:0.2 ;
fc = 100 ;
Ac = 10 ;
kp = 10 ;
Xm = sin(20*pi*time) ;
PhaseModulation = p3_pmm(Xm , Ac , fc , kp , fs) ;
NarrowbandModulation = p4_nb(Xm , Ac , fc , kp , fs) ;

figure;
subplot(1,2,1);
plot(time,PhaseModulation) ;
title(' PhaseModulation ')  
xlabel('Time(s)');
ylabel('Xc(t)');

subplot(1,2,2);
plot(time,NarrowbandModulation) ;
title(' NarrowbandModulation ')  
xlabel('Time(s)');
ylabel('Xc(t)');
%% Part_8_9
fs = 10000 ;
Ts = 1/fs ;          % Sampling period
time = 0:Ts:0.2 ;
fc = 100 ;
Ac = 10 ;
Xm = sin(20*pi*time) ;
Kp = -1:0.001:1 ;      % Kp --> [-1 , 1]
MSE = [] ;            % Mean Squared Error
MaxKp = 0 ;           % Maximum Kp to have 1 percent error
for kp = -1:0.001:1    
    PhaseModulation = p3_pmm(Xm , Ac , fc , kp , fs) ;
    NarrowbandModulation = p4_nb(Xm , Ac , fc , kp , fs) ;
    MSE(end + 1) =  immse( PhaseModulation , NarrowbandModulation ) ;
    if immse( PhaseModulation , NarrowbandModulation ) < 0.1
        MaxKp = kp ;
    end
end

plot(Kp,MSE) ;
title(' Mean Squared Error ')  
xlabel('Kp');
ylabel('MSE');
%% Part_10
fs = 10000 ;
Ac = 10 ;
fc = 100 ;
B = [0.1 ,1 ,5 ,10] ;
Ts = 1/fs ;          % Sampling period
time = 0:Ts:0.2 ;
Xm = sin(20*pi*time) ;
fm = 10 ;
Xc = [] ;
frequency = -500:0.5:500 ;

for Counter = 1:1:4
    Xc = Ac * cos((2*pi*fc*time)+(B(Counter)*sin(2*pi*fm*time))) ;
    Y = fft(Xc) ;
    Y = fftshift(Y) ;
    figure;
    plot(frequency,abs(Y)) ;
    xlim([-30 30])
    title(['Single Tone Modulation','B = ',num2str(B(Counter))])
    xlabel('frequency(Hz)');
    ylabel('Y');
end
%% Part_11_12
fs = 10000 ;
Ac = 10 ;
fc = 100 ;
B = [0.1 ,1 ,5 ,10] ;
Ts = 1/fs ;          % Sampling period
time = 0:Ts:0.2 ;
Xm = sin(20*pi*time) ;
fm = 10 ;
Xc = [] ;
Bc = [] ; 
N = [1 , 3 , 9 , 23] ;
frequency = -500:0.5:500 ;

for Counter = 1:1:4
    Xc = Ac * cos((2*pi*fc*time)+(B(Counter)*sin(2*pi*fm*time))) ;
    Y = fft(Xc) ;
    Y = fftshift(Y) ;
    figure;
    plot(frequency,abs(Y)) ;
    hold on
    title(['Single Tone Modulation','B = ',num2str(B(Counter))])
    xlabel('frequency(Hz)');
    ylabel('Y');

    Xc = 0 ;
    for n = -N(Counter):1:N(Counter)
        Xc = Xc + ( besselj(n,B(Counter)) * cos(2*pi*(fc + n*fm)*time) ) ;
    end
    Xc = Xc * Ac ;
    Y = fft(Xc) ;
    Y = fftshift(Y) ;
    plot(frequency,abs(Y)) ;
    grid on
    legend('Y_1','Y_2','Location','Best')
    hold off
    Bc(Counter) = 2 * (B(Counter) + 1) * fm ;
end
%% Part_14
fs = 10000 ;
Ts = 1/fs ;          % Sampling period
time = 0:Ts:0.2 ;
fc = 100 ;
Ac = 10 ;
kp = 10 ;
kf = 100 ;
Xm = sin(20*pi*time) ;
PhaseModulation = p3_pmm(Xm , Ac , fc , kp , fs) ;
FrequencyModulation = p3_fmm(Xm , Ac , fc , kf , fs) ;

figure;
subplot(1,2,1);
plot(time,PhaseModulation) ;
title(' PhaseModulation ')  
xlabel('Time(s)');
ylabel('Xc(t)');

subplot(1,2,2);
plot(time,FrequencyModulation) ;
title(' FrequencyModulation ')  
xlabel('Time(s)');
ylabel('Xc(t)');