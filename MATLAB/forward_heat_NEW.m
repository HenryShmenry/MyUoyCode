function [x,t,w]=forward_heat_NEW(L,T,N,M)
% Solves the heat equation u_t=u_xx by forward difference method for 0<x<L, 0<t<T;
% N is the number of subintervals in x, M is the number of subintervals in t 
w=zeros(N+1,M+1);
tau=T/M;
h=L/N;
gamma=tau/h^2;
%function defining initial condition and extra
f=@(x)-0.6*cos(pi*x);
g=@(x)18*x*(1-x^2);
%calculation of grid points and initial condittion

% Stability check
if gamma > 0.5
    error('Unstable conditions: gamma must be <= 0.5.');
end

x=(0:N)*h;
t=(0:M)*tau;
w(:,1)=f(x);
%implementation of the forward difference method
for m=1:M
    % Boundary Conditions:
    w(1,m+1) = -0.6;
    w(N+1,m+1) = 0.6;
    for k=2:N
        % Forward Difference Method
        w(k,m+1)=(1-2*gamma-2*tau)*w(k,m)+gamma*(w(k-1,m)+w(k+1,m))+tau*g(x(k));
    end
end
%plot of the surface z=u(x,t)
w=w';
surf(x,t,w);
title([' \gamma= ', num2str(gamma)]);