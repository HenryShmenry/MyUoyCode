function [x,y] = circlefn(r)
%------------------------------------
% circlefn - a function to draw a circle of radius r
%------------------------------------
theta = linspace(0, 2*pi,100);
x = r*cos(theta);
y = r*sin(theta);
plot(x,y);
axis('equal');
title(['circle of radius r=', num2str(r)]);
end