function [xx,D2f] = second_derivative(x,f)
%given a set of equally spaced points, x, and the values of a function at
%these points, second_derivative.m computes the second derivative of f by
%the central difference method
n=length(x);
xx=x(2:n-1); %selecting interior points
h=(x(end)-x(1))/(n-1); %step length
%computing the derivative
D2f = zeros(1, n-2);

for k=1:n-2
    D2f(k)=(f(k)-2*f(k+1)+f(k+2))/h^2;
end
%%%%%%% plot f and D2f
plot(x,f,'b', xx, D2f, 'go');
xlabel('x'); ylabel('f and d^2 f/dx^2'); grid;
legend('f(x)', 'd^2f/dx^2');
end