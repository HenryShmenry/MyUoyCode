%example1.m
x = (0:20)/20;
t = (0:20)/20;
m = 0;
sol = pdepe(m,@pdefun1,@pdeic1,@pdebc1,x,t);
u = sol(:,:,1);
figure(1)
surf(x,t,u)
title('Surface plot of numerical solution');
xlabel('Distance x');
ylabel('Time t');
figure(2)
plot(x,u(end,:))
title('Solution at t = 1')
xlabel('Distance x')
ylabel('u(x,1)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [c,f,s] = pdefun1(x,t,u,DuDx)
c = 1;
f = 0.1*DuDx;
s = 0;
end

function u0 = pdeic1(x)
u0 = sin(pi*x);
end

function [pl,ql,pr,qr] = pdebc1(xl,ul,xr,ur,t)
pl = ul;
ql = 0;
pr = 0;
qr = 10;
end
