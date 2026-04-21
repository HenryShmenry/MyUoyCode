% circle – a script file to draw a unit circle
theta=(0:100)*2*pi/100;
x=cos(theta);
y=sin(theta);
plot(x, y, 'g');
axis('equal');
xlabel('x');
ylabel('y');
title('Circle of unit radius')