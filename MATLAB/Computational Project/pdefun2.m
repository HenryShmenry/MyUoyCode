function [c,f,s] = pdefun2(x,t,u,DuDx)
c = 1;
f = 0.33*DuDx;
s = -1.13*u*DuDx;