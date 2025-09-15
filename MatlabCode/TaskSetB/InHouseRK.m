%In this function, f acts as the dT/dt

function [Ta, ta] = InHouseRK(to,tf,To,n,f)
    T = To;
    ta = linspace(to,tf,n); % Initialize indipendant variable values
    h = (ta(2)-ta(1));
    Ta = zeros(size(ta)+1); % Initialize Ta to store results
    for i = 
        Ta(i+1) = T + f(i)*h;
        T=Ta(i+1);
    end
