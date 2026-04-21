function f=myexp(x,n)
% myexp(x,n) approximates exp(x) by its n-th Taylor polynomial at 0
f=1;
c=1;
for k=1:n
    c=c*x/k;
    f=f+c;
end