function [pl,ql,pr,qr] = pdebc2(xl,ul,xr,ur,t)
pl = 0;
ql = (100/33);
pr = ur - 0.6;
qr = 0;