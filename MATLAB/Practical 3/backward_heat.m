function backward_heat(T,M,x,u0)
% Solves the heat equation by backward difference method and plots the 
% result; x - (pre-calculated) array of grid points
% in x, u0 - (pre-calculated) initial condition at grid points
N=length(x)-1;
if (N+1)~=length(u0)
    error('Dimensions of x and u0 must agree')
end
h=(x(N+1)-x(1))/N; tau=T/M; gamma=tau/h^2
w=zeros(N+1,M+1);

% grid points
t=(0:M)*tau;

% initial condition
w(:,1)=u0;

% solving the tridiagonal system by the double-sweep method
alpha=zeros(1,N);
beta=zeros(1,N);
for m=2:(M+1)
    for k=1:(N-1)
        alpha(k+1)=gamma/(1+gamma*(2-alpha(k)));
        beta(k+1)=(beta(k)*gamma+w(k+1,m-1))/(1+gamma*(2-alpha(k)));
    end
    for k=(N+1):(-1):3
        w(k-1,m)=alpha(k-1)*w(k,m)+beta(k-1);
    end
end
% surface plot of u(x,t)
w=w';
surf(x,t,w);



