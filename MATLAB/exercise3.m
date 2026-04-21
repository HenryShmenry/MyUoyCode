%exercise3.m solution to Exercise 3

x=(0:50)/50; %x points
t=(0:40)/40; %t points
sol = pdepe(0,@pdefun777,@pdeic777,@pdebc777,x,t);
u=sol(:,:,1);
surf(x,t,u);
xlabel('x');
ylabel('t');

%functions
function [c,f,s] = pdefun777(x,t,u,DuDx)
c = 1;
f = 0.1*(1+u^2)*DuDx;
s = 0;
end

function [pl,ql,pr,qr] = pdebc777(xl,ul,xr,ur,t)
pl = 0;
ql = 1;
pr = 0;
qr = 1;
end

function u0 = pdeic777(x)
if abs(x-0.5) < 0.1    
    u0=0.5*sin(5*pi*(x-0.4));
else
    u0=0;
end
end
