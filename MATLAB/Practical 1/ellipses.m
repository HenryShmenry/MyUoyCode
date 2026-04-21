% Ellipse – a script file to draw a ellipse
theta=(0:100)*2*pi/100;
a=2;
b=3;
x1=a*cos(theta);
y1=b*sin(theta);
x2=(a+1)*cos(theta);
y2=(b-2)*sin(theta);
plot(x1, y1, 'g', x2, y2, 'r');
axis('equal');
xlabel('x');
ylabel('y');
title('Double Ellipses')