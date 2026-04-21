function [pl,ql,pr,qr] = pdebc5(xl,ul,xr,ur,t)
pl = ul+1;
ql = 0;
pr = ur-1;
qr = 0;