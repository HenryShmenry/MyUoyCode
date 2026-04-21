function l = myline(a, b, c, d)
    x = linspace(a, c, 100);
    if a == c
        x=[a,c];
        y=[b,d];
        plot(x,y);
    else  
    y = b + (d - b) / (c - a) * (x - a);
    l = plot(x, y);
    end
end