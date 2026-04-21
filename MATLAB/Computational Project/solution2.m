%solution2.m
x = (-30:30)/3; % Space Grid Points
t = (0:50)/10; % Time Grid Points
m = 0; % Symmetry type seen in the rearranged equation.
sol = pdepe(m,@pdefun2,@pdeic2,@pdebc2,x,t); % The solver
u = sol(:,:,1);
figure(1) 
surf(x,t,u) % The surface plot
title('Surface plot of numerical solution');
xlabel('Distance x');
ylabel('Time t');
zlabel('u(x,t)')
figure(2)
plot(x,u(end,:), 'DisplayName', 'u(x, 0.3)')
hold on % This is used to plot all graphs on one plot.
plot(x, u(1, :), 'DisplayName', 'u(x, 0)');
plot(x,u(10, :), 'DisplayName', 'u(x, 2.5)');
hold off
lgd = legend % A legend to help distinguish between the plots
legend('Location', 'southwest') % The position of the legend
xlabel('Distance x')
ylabel('u(x,t)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Functions
function [pl,ql,pr,qr] = pdebc2(xl,ul,xr,ur,t) 
%------------------------------------
% The function to incorporate the boundary conditions
%------------------------------------
pl = 0;
ql = (100/33);
pr = ur - 0.6; % Shouldve had ur - 0.6 instead of just ur
qr = 0;
end

function [c,f,s] = pdefun2(x,t,u,DuDx)
%------------------------------------
% pdefun2 is a function that defines the components of the pde after being
% rearranged into the form:
% c(x,t,u,DuDx)*DuDt=x^(-m)*DDt(x^(m)*f(x,t,u,DuDt))+s(x,t,u,DuDt)
%------------------------------------
c = 1;
f = 0.33*DuDx;
s = -1.13*u*DuDx;
end

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