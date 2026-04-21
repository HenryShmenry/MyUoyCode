function trianglefn(a,b,c,d,e,f)
%--------------------------------
% The Triangle Function plots a triangle with a node at coordinates (a,b),
% (c,d) and (e,f) utilising the myline function.
%--------------------------------
    myline(a,b,c,d);
    hold on;
    myline(c,d,e,f);
    hold on;
    myline(e,f,a,b);
end
