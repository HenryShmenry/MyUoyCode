function f=mysum(n)
%---------------------------------
% mysum(n) summarises the reciprocal squares from 1 to n
%---------------------------------
f=0;
for i = 1:n
    f=f+i^(-2);
end