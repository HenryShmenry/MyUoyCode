% Ellipse – a script file to draw a ellipse
theta=(0:100)*2*pi/100;
a=2;
b=3;
x=a*cos(theta);
y=b*sin(theta);
plot(x, y, 'g');
axis('equal');
xlabel('x');
ylabel('y');
title('Ellipse')