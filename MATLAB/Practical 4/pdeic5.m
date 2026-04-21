function u0 = pdeic5(x)
%u0 = sin(0.5*pi*x);
if x<0
    u0=-1;
elseif x==0
    u0=0;
else
    u0=1;
end