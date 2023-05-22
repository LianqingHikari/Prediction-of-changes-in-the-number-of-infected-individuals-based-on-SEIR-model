%Please reset the data here

N = 1000000; %Total population
E = 0;         %exposed persons                                          
I = 1;   %the number of infected person
S = N - I;  %Susecptible persons 
R = 0;  %recovered persons 
     
beta = 0.5;%contact rate by an infected people at a point in time
alpha = 0.8;  %rate of conversion from exposed to infected
gamma = 0.083;  %recovery rate

T = 1:100;   %day
for idx = 1:length(T)
    C(1)=1; 
    S(idx+1) = S(idx) - beta*S(idx)*I(idx)/N;  %SEIR model to calculate S E I R
    E(idx+1) = E(idx) + beta*S(idx)*I(idx)/N-alpha*E(idx);
    I(idx+1) = I(idx) + alpha*E(idx) - gamma*I(idx);
    R(idx+1) = R(idx) + gamma*I(idx);
    C(idx)=I(idx)+R(idx); % confirmed case number 
end

plot(T,C);
xlabel('Days');ylabel('Number of people')
title('SEIR Model')