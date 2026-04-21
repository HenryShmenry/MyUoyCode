%example3.m

x = (0:50)/50;
t = (0:50)/25;
m = 0;
sol = pdepe(m,@pdefun6,@pdeic6,@pdebc6,x,t);
u1 = sol(:,:,1);
u2 = sol(:,:,2);
figure(1)
surf(x,t,u1);
title('Plot of u(x,t)');
xlabel('x');
ylabel('t');
figure(2)
surf(x,t,u2);
title('Plot of v(x,t)');
xlabel('x');
ylabel('t');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [c,f,s] = pdefun6(x,t,u,DuDx)
c = [1;1];
f = [0.1;1].*DuDx;
s = [-u(1)+u(2);u(1)-u(2)];
end

function u0 = pdeic6(x)
u0 = [sin(pi*x)+1-x;-sin(pi*x)+x];
end

function [pl,ql,pr,qr] = pdebc6(xl,ul,xr,ur,t)
pl = [ul(1)-1; ul(2)];
ql = [0;0];
pr = [ur(1); ur(2)-1];
qr = [0;0];
end
