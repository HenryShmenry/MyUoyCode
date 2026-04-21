function [pl,ql,pr,qr] = pdebc6(xl,ul,xr,ur,t)
pl = [ul(1)-1; ul(2)];
ql = [0;0];
pr = [ur(1); ur(2)-1];
qr = [0;0];
end