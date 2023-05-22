%These data are used to predict,you should reset it
data=[444 444 549 761 1058 1423 3554 3554 4903 5806 7153 11177 13522 16678 19665 22112 24953 27100 29631 31728 33366 33366 48206 54406 56249 58182 59989 61682 61031 62442];

y=do_SEIR(data);%get the predicted parameters
%y(1)=beta, y(2)=gamma, y(3)=alpha, y(4)=S0


function y = do_SEIR(sdata)
funct = @(x) findmin(x, sdata);
y = fmincon(funct, [0, 0, 0 ,0], [], [], [], [], [0, 0, 0 ,0], [1, 1, 1,inf]);
%use fmincon to find the parameters
end

function y=findmin(x,sdata)
    beta=x(1),gamma=x(2),alpha=x(3),S0=x(4)
    E = 0;         %exposed persons                                          
    I = 1;   %the number of infected person
    S = S0;  %Susecptible persons 
    N = S+I; %Total population
    R = 0;  %recovered persons 
    L=length(sdata);%sdata means simulated data
    for idx = 1:L
        S(idx+1) = S(idx) - beta*S(idx)*I(idx)/N;  %SEIR model to calculate S E I R
        E(idx+1) = E(idx) + beta*S(idx)*I(idx)/N-alpha*E(idx);
        I(idx+1) = I(idx) + alpha*E(idx) - gamma*I(idx);
        R(idx+1) = R(idx) + gamma*I(idx);
        C(idx)=I(idx)+R(idx); % confirmed case number 
    end
    pdata=C;% pdata means predicted data
    minnumber=0;
    for i=1:L
        minnumber=minnumber+(sdata(i)-pdata(i))^2;%Calculate the error value
    end
    y=minnumber;;
end


