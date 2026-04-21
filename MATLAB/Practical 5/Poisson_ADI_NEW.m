function u=Poisson_ADI_NEW(N,NN,tol)
% solves Poisson equation in a unit square (with zero boundary
% condition) by ADI relaxation method.
%N is the number of subintervals in [0,1].
%NN is the maximum number of iterations.
%tol is the tolerance
h=1/N;
tau=h/pi; % optimal time step
gamma=N/pi;
u=zeros(N+1,N+1);
u1=zeros(N+1,N+1);
alpha=zeros(N,1);
beta=zeros(N,1);
% grid points 
for k=1:N-1
    alpha(k+1)=gamma/(2*(1+gamma)-gamma*alpha(k));
end
x=(0:N)/N;
y=x;
% ADI iterations
for n=1:100
    v=u;
    for j=2:N
        for k=1:N-1
            F=-0.5*gamma*(u(k+1,j-1)+u(k+1,j+1))-(1-gamma)*u(k+1,j)+0.5*tau*ff(x(k+1),y(j));
            beta(k+1)=(beta(k)*gamma-2*F)/(2*(1+gamma)-gamma*alpha(k));
        end
        for k=N:(-1):2
            u1(k,j)=alpha(k)*u1(k+1,j)+beta(k);
        end
    end
    for k=2:N
        for j=1:N-1
            F=-0.5*gamma*(u1(k-1,j+1)+u1(k+1,j+1))-(1-gamma)*u1(k,j+1)+0.5*tau*ff(x(k),y(j+1));
            beta(j+1)=(beta(j)*gamma-2*F)/(2*(1+gamma)-gamma*alpha(j));
        end
        for j=N:(-1):2
            u(k,j)=alpha(j)*u(k,j+1)+beta(j);
        end
    end    
   if norm(u-v,inf)<tol % comparison with preceding iteration 
        break
    else
        continue
    end
end
if n==NN
    disp('        No convergence')
else
    disp(['The method converges after ',num2str(n),' iterations']);
    surf(x,y,u');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% function f(x,y) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function g=ff(x,y)
g=50*sin(2*pi*x)*sin(2*pi*y);
        
