function [c,f,s] = pdefun1(x,t,u,DuDx)
c = 1;
f = 0.1*DuDx;
s = 0;