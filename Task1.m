N = 1000000;               %Total population                                                 
I = 1;         %the number of infected persons                                                          
S = N - I;       %Susecptible persons                                                           
R = 0;             %recovered persons                                                         

beta = 0.2;         %contact rate by an infected people at a point in time                                                          
gamma = 0.083;      %recovery rate                                                       

T = 1:200;    %time
for idx = 1:length(T)-1%%SIR model
    S(idx+1) = S(idx) - beta*S(idx)*I(idx)/N;
    I(idx+1) = I(idx) + beta*S(idx)*I(idx)/N - gamma*I(idx);
    R(idx+1) = R(idx) + gamma*I(idx);
end

plot(T,S,T,I,T,R);%draw the picture
grid on;
xlabel('Days');ylabel('Number of people')
legend('S','I','R')
title('SIR Model of COVID-19 with R0=0')