function [x,t,w]=forward_heat_00(L,T,N,M)
% Solves the heat equation u_t=u_xx by forward difference method for 0<x<L, 0<t<T;
% N is the number of subintervals in x, M is the number of subintervals in t 
w=zeros(N+1,M+1);
tau=T/M;
h=L/N;
gamma=tau/h^2
%function defining initial condition
f=@(x)2*sin(2*pi*x);
%calculation of grid points and initial condittion
x=(0:N)*h;
t=(0:M)*tau;
w(:,1)=f(x);
%implementation of the forward difference method
for m=1:M
    for k=2:N
        w(k,m+1)=(1-2*gamma)*w(k,m)+gamma*(w(k-1,m)+w(k+1,m));
    end
end
%plot of the surface z=u(x,t)
w=w';
surf(x,t,w);
title([' \gamma= ', num2str(gamma)]);




