function [x,Df] = second_derivative(x,f)
%given a set of equally spaced points, x, and the values of a function at
%these points, second_derivative.m computes the second derivative of f by
%the central difference method
n=length(x);
x=x(2:n-1); %selecting interior points
h=(x(end)-x(1))/(n-1); %step length
%computing the derivative
Df = zeros(1, n-1);

for k=1:n-1
    Df(k)=(f(k)+f(k+1))/(2*h);
end
end