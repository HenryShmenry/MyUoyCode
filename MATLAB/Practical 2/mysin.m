function s=mysin(x,n)
%---------------------------------------
% mysin(x,n) approximates sin(x) by it's Taylor series at 0 with error less
% than 10^-4. 
%---------------------------------------
s=0;
for i=0:n
    s = s + ((-1)^i) * x^(2*i+1) / factorial(2*i+1);
    if (abs(x^(2*i+3) / factorial(2*i+3)) < 10^-4)
        break;
    end
end