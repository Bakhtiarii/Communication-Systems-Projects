%% Part: 1 Q: 1
mu = 0 ;  sigma = 1 ;
a = 0 ;   b = 1 ;
number = 2000 ;
nbins = 100 ;

V1 = normrnd(mu,sigma,[1,number]) ;     %Normal distribution
V2 = a + (b-a).*rand(1,number) ;        %Uniform distribution

figure;                                 %Plot H1
H1 = histogram(V1,nbins) ;
ylabel('H1');
title(' mu = 0 , sigma = 1 ') 

figure;                                 %Plot H2
H2 = histogram(V2,nbins) ;
title(' Uniform distribution (0 , 1) ') 
ylabel('H2');

figure;                                 %Plot H1 and H2 together
H1 = histogram(V1,nbins) ;
hold on
H2 = histogram(V2,nbins) ;
title(' H1 and H2 together ') 
ylabel('H1 and H2');
%% Part: 1 Q: 2
mu = 0 ;  sigma = 1 ;
a = 3^(0.5) ; 
number = 2000 ;
                                       %Normal distribution
N1 = normrnd(mu,sigma,[1,number]) ;  
N2 = normrnd(mu,sigma,[1,number]) ;

figure;   
plot(N1,N2,'.') ;                      %Plot Joint distribution N1 and N2
title(' Joint distribution ( N1 , N2 ) ') 
xlabel(' N1 ');
ylabel(' N2 ');
                                       %Uniform distribution
U1 = -a + (a+a).*rand(1,number) ;
U2 = -a + (a+a).*rand(1,number) ;

figure;                                %Plot Joint distribution U1 and U2
plot(U1,U2,'.') ;
title(' Joint distribution ( U1 , U2 ) ') 
xlabel(' U1 ');
ylabel(' U2 ');

figure;                                %Plot Joint distribution N1 and U1
plot(N1,U1,'.') ;
title(' Joint distribution ( N1 , U1 ) ') 
xlabel(' N1 ');
ylabel(' U1 ');
%% Part: 1 Q: 3
mu = 0 ;  sigma = 1 ;
a = 3^(0.5) ; 
number = 2000 ;
nbins = 70 ;
sigma_Y = 0.1 ;     Y_Hat = 0.5 ;
sigma_U = 0.1 ;     U_Hat = 0.5 ;
                                       %Normal distribution
X = normrnd(mu,sigma,[1,number]) ;  
Y = normrnd(mu,sigma,[1,number]) ;
                                       %Uniform distribution
U = -a + (a+a).*rand(1,number) ;

Conditional_Distribution_XY = [ ] ;
Conditional_Distribution_XU = [ ] ;

for Counter_1 = 1:2000                    
    if (Y(Counter_1)>=(Y_Hat-sigma_Y) && Y(Counter_1)<=(Y_Hat+sigma_Y))
        Conditional_Distribution_XY(end+1) = X(Counter_1) ;
    end
end

figure;                                 %Plot P(x | y = y_Hat)
H1 = histogram(Conditional_Distribution_XY,nbins) ;
ylabel('H1');
title(' P(x | y = y hat) ') 

for Counter_2 = 1:2000                    
    if (U(Counter_2)>=(U_Hat-sigma_U) && U(Counter_2)<=(U_Hat+sigma_U))
        Conditional_Distribution_XU(end+1) = X(Counter_2) ;
    end
end

figure;                                 %Plot P(x | u = u_Hat)
H2 = histogram(Conditional_Distribution_XU,nbins) ;
ylabel('H2');
title(' P(x | u = u hat) ') 
%% Part: 2 Q: 1
mu = 0 ;  sigma = 1 ;
number = 2000 ;
nbins = 300 ;
Alpha = [0.5 , -0.5 , 0.9 , -0.9] ; 
Correlation = [] ;   
                                       %Normal distribution (X , Y)
X = normrnd(mu,sigma,[1,number]) ;  
Y = normrnd(mu,sigma,[1,number]) ;

Z1 = [] ;  Z2 = [] ;  Z3 = [] ;  Z4 = [] ;
E_XZ1 = 0 ;  E_XZ2 = 0 ;  E_XZ3 = 0 ;  E_XZ4 = 0 ;
                                                      %Z1 (Alpha = 0.5)
Z1 = X*Alpha(1) + sqrt(1 - (Alpha(1)*Alpha(1)))*Y ;
E_XZ1 = abs(sum(X.*Z1)/number) ;
                                                      %Z2 (Alpha = -0.5)
Z2 = X*Alpha(2) + sqrt(1 - (Alpha(2)*Alpha(2)))*Y ;
E_XZ2 = -abs(sum(X.*Z2)/number) ;
                                                      %Z3 (Alpha = 0.9)
Z3 = X*Alpha(3) + sqrt(1 - (Alpha(3)*Alpha(3)))*Y ;
E_XZ3 = abs(sum(X.*Z3)/number) ;
                                                      %Z4 (Alpha = -0.9)
Z4 = X*Alpha(4) + sqrt(1 - (Alpha(4)*Alpha(4)))*Y ;
E_XZ4 = -abs(sum(X.*Z4)/number) ;

Variance_Z = var(Z1) ;
Average_Z = abs(sum(Z1) / number) ;
                                        %Plot Z distribution ( Alpha = 0.5 )
H1 = histogram(Z1,nbins) ;
title(' Z distribution ( Alpha = 0.5 ) ') 
ylabel('H1');
                                        %Plot Correlation
figure; 
Correlation = [E_XZ1 , E_XZ2 , E_XZ3 , E_XZ4] ;
plot(Alpha , Correlation , '*');
title(' Correlation ') 
xlabel('Alpha');
%% Part: 2 Q: 2
mu = 0 ;  sigma = 1 ;
number = 2000 ;
nbins = 70 ;
Alpha = [0.7 -0.7] ;  
sigma_Z = 0.1 ;     Z_Hat_1 = 0.5 ;     Z_Hat_2 = -0.5 ;
                                       %Normal distribution (X , Y)
X = normrnd(mu,sigma,[1,number]) ;  
Y = normrnd(mu,sigma,[1,number]) ;

Z1 = [] ;  Z2 = [] ;
E_XZ1 = 0 ;  E_XZ2 = 0 ;
                                                      %Z1 (Alpha = 0.7)
Z1 = X*Alpha(1) + sqrt(1 - (Alpha(1)*Alpha(1)))*Y ;
E_XZ1 = abs(sum(X.*Z1)/number) ;
                                                      %Z2 (Alpha = -0.7)
Z2 = X*Alpha(2) + sqrt(1 - (Alpha(2)*Alpha(2)))*Y ;
E_XZ2 = abs(sum(X.*Z2)/number) ;

Conditional_Distribution_XZ_1 = [ ] ;        % (Alpha = 0.7) (Z = 0.5)
Conditional_Distribution_XZ_2 = [ ] ;        % (Alpha = 0.7) (Z = -0.5)
Conditional_Distribution_XZ_3 = [ ] ;        % (Alpha = -0.7) (Z = 0.5)
Conditional_Distribution_XZ_4 = [ ] ;        % (Alpha = -0.7) (Z = -0.5)

for Counter_1 = 1:2000                    
    if (Z1(Counter_1)>=(Z_Hat_1-sigma_Z) && Z1(Counter_1)<=(Z_Hat_1+sigma_Z))
        Conditional_Distribution_XZ_1(end+1) = X(Counter_1) ;
    end
end

figure;                                 %Plot P(x | z = 0.5) and (Alpha = 0.7)
H1 = histogram(Conditional_Distribution_XZ_1,nbins) ;
ylabel('H1');
title(' P(x | z = 0.5) and (Alpha = 0.7) ') 

for Counter_2 = 1:2000                    
    if (Z1(Counter_2)>=(Z_Hat_2-sigma_Z) && Z1(Counter_2)<=(Z_Hat_2+sigma_Z))
        Conditional_Distribution_XZ_2(end+1) = X(Counter_2) ;
    end
end

figure;                                 %Plot P(x | z = -0.5) and (Alpha = 0.7)
H2 = histogram(Conditional_Distribution_XZ_2,nbins) ;
ylabel('H2');
title(' P(x | z = -0.5) and (Alpha = 0.7) ') 

for Counter_3 = 1:2000                    
    if (Z2(Counter_3)>=(Z_Hat_1-sigma_Z) && Z2(Counter_3)<=(Z_Hat_1+sigma_Z))
        Conditional_Distribution_XZ_3(end+1) = X(Counter_3) ;
    end
end

figure;                                 %Plot P(x | z = 0.5) and (Alpha = -0.7)
H3 = histogram(Conditional_Distribution_XZ_3,nbins) ;
ylabel('H3');
title(' P(x | z = 0.5) and (Alpha = -0.7) ') 

for Counter_4 = 1:2000                    
    if (Z2(Counter_4)>=(Z_Hat_2-sigma_Z) && Z2(Counter_4)<=(Z_Hat_2+sigma_Z))
        Conditional_Distribution_XZ_4(end+1) = X(Counter_4) ;
    end
end

figure;                                 %Plot P(x | z = -0.5) and (Alpha = -0.7)
H4 = histogram(Conditional_Distribution_XZ_4,nbins) ;
ylabel('H4');
title(' P(x | z = -0.5) and (Alpha = -0.7) ') 
%% Part: 3 Q: 1
K = 256 ;  N = 256 ;                  %Indicates the size of the matrix
mu = 0 ;  sigma = 1 ;
mu_hat = [] ;    x_hat = [] ;

X_normal = normrnd(mu,sigma,N,K);     %Normal distribution

for Counter1 = 1:N                    %Generating x_hat
    x_hat(end+1) = mean(X_normal(:,Counter1));
end

for Counter2 = 1:K                    %Generating mu_hat
    mu_hat(end+1) = mean(X_normal(Counter2,:));
end

figure                                %Plot x_hat
plot(x_hat);                          
title('x hat'); 
                                     
figure                                %Plot mu_hat
plot(mu_hat);                          
title('mu hat');
xlabel('time');
%% Part: 3 Q: 2
K = 256 ;  N = 256 ;                  %Indicates the size of the matrix
mu = 0 ;  sigma = 1 ;
E_X1X2 = 0 ;   Correlation = 0 ;
n = [150 , 250] ;                     % n1 = 150  ,  n2 = 250 

X_normal = normrnd(mu,sigma,N,K);     %Normal distribution

figure                                %Plot random process distribution function
plot(X_normal(n(1),:),X_normal(n(2),:),'.');
title('random process distribution function ( n1 = 150 , n2 = 250 )');
xlabel('time');

E_X1X2 = X_normal(n(2),:).*X_normal(n(1),:) ;
Correlation = sum(E_X1X2)/K ;
%% Part: 4 Q: 4
%% Part: 4 Q: 5