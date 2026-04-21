function myplot(L, T, M, t1, t2, t3)
%------------------------------------------------
% The myplot function produces 3 2D plots of the solution to our given heat
% equation at 3 separate iterations of time. 
% L, T, M: Inputs for the backward_heat_NEW function.
% t1: The plot for the first time.
% t2: The plot for the second time.
% t3: The plot for the third time. 
%------------------------------------------------

%First we calculate the solution plot:
[x,~,w] = backward_heat_NEW(L,T,M);

% Finds the index points of each time input
w1 = w(floor((t1*L)/T+1), :);
w2 = w(floor((t2*L)/T+1), :);
w3 = w(floor((t3*L)/T+1), :);

% making the plots with a legend to help distinguish between them:
plot(x, w1, 'DisplayName', 'u(x, 0)');
hold on
plot(x, w2, 'DisplayName', 'u(x, 0.1)');
plot(x, w3, 'DisplayName', 'u(x, 0.3)');
hold off
legend('Location','southeast') % The position of the legend in the plot
%% Backward_heat_New Function:
function [x,t,w]=backward_heat_NEW(L,T,M)
%-----------------------------------------------------------------
% Solves the heat equation by backward difference method and plots the
% solution as a surface plot.
% L <- Number of spacial grid points
% T <- The time interval of the solution
% M <- Number of time steps
%-----------------------------------------------------------------

x=(0:L)/L;

%function defining initial condition and extra
f=@(x)-0.6*cos(pi*x); % initial condition
g=@(x)18 * x .* (1 - x.^2); % source term

u0=f(x);

N=length(x)-1;
if (N+1)~=length(u0)
    error('Dimensions of x and u0 must agree')
end
h = (x(N + 1) - x(1)) / N; 
tau = T / M; 
gamma = tau / h^2;
w = zeros(N + 1, M + 1);

% grid points
t = (0:M) * tau;

% initial condition
w(:, 1) = u0;

% solving the tridiagonal system by the double-sweep method
alpha=zeros(1,N);
beta=zeros(1,N);
for m=2:(M+1)

    % Boundary Conditions:
    w(1,m)= -0.6;
    w(N+1,m) = 0.6;
    beta(1) = w(1,m);

    for k=1:(N-1)
        alpha(k+1) = gamma/(1+gamma*(2-alpha(k))+2*tau); % Should've been +2*tau instead of -2*tau
        beta(k+1) = (beta(k)*gamma+w(k+1,m-1)+tau*g(x(k+1)))/(1+gamma*(2-alpha(k))-2*tau);
    end

    for k=(N+1):(-1):3
        w(k-1,m)=alpha(k-1)*w(k,m)+beta(k-1);
    end
end

% surface plot of u(x,t)
w=w';
surf(x,t,w);

% Adding Labels to the plot
xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Numerical Solution');