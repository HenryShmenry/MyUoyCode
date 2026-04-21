function [c,f,s] = pdefun5(x,t,u,DuDx)
c = 1;
f = 0.1*DuDx;
s = u*abs(u)/(1+u^2);