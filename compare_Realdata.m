

%C is the real data, please reset it.
C=[15 15 15 51 51 57 58 60 68 74 98 118 149 217 262 402 518 583 959 1281 1663 2179 2727 3499 4632 6421 7783 13747 19273 25600 33276 43843 53736 65778 83836 101657 121465 140909 161831 188172 213242 243622 275367 308650 336802 366317 397121 428654 462780 496535 526396 555313 580619 607670 636350 667592 699706 732197 758809 784326];

k=length(C)%the length of the data

T = 1:k;   

plot(T,C);%draw the picture of the real data
hold on

%please reset the parameter.

E = 0;         %exposed persons                                          
I = 1;   %the number of infected person
S = 1.680782364879681e+06;  %Susecptible persons 
N = S+I; %Total population
R = 0;  %recovered persons 
     
beta = 0.358104550138834;%contact rate by an infected people at a point in time
alpha = 0.999952070203294;  %rate of conversion from exposed to infected
gamma = 0.494767599018241;  %recovery rate

T = 1:k;   %day
for idx = 1:length(T)
    C(1)=1; 
    S(idx+1) = S(idx) - beta*S(idx)*I(idx)/N;  %SEIR model to calculate S E I R
    E(idx+1) = E(idx) + beta*S(idx)*I(idx)/N-alpha*E(idx);
    I(idx+1) = I(idx) + alpha*E(idx) - gamma*I(idx);
    R(idx+1) = R(idx) + gamma*I(idx);
    C(idx)=I(idx)+R(idx); % confirmed case number 
end

%draw the picture of predicted data
plot(T,C)
xlabel('Days');ylabel('Number of people')
legend('Real data','Predicted data')
title('SEIR Model')