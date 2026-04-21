function u0 = pdeic2(x)
%------------------------------------
% pdeic2 is the function representing the initial conditions of our given problem
% u0: The initial condition function. In this case, it is piecewise. 
%------------------------------------
if abs(x) > 1.2    
    u0=0.9;
else
    u0=0.3;
end
end