function [c,f,s] = pdefun6(x,t,u,DuDx)
c = [1;1];
f = [0.1;1].*DuDx;
s = [-u(1)+u(2);u(1)-u(2)];
end