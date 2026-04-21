%example2.m

x = (0:50)/50;
t = (0:50)/50;
m = 0;
sol = pdepe(m,@pdefun5,@pdeic5,@pdebc5,x,t);
u = sol(:,:,1);
surf(x,t,u)
title('Surface plot of numerical solution');
xlabel('Distance x');
ylabel('Time t');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [c,f,s] = pdefun5(x,t,u,DuDx)
c = 1;
f = 0.5*u^2*DuDx;
s = -u;
end

function u0 = pdeic5(x)
if x<0.5
u0 = 0;
else
u0=2*(x-0.5);
end
end

function [pl,ql,pr,qr] = pdebc5(xl,ul,xr,ur,t)
pl = ul;
ql = 0;
pr = ur-1;
qr = 0;
end
