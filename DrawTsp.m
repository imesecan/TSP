function [dist]=DrawTsp(x, y, ord, rad, fig)
    figure (fig);
    clf (fig);
    [m n]=size(x);
    
    dist = distance(x,y,ord, n);
    hold on
    for i=1:n, 
        iy=ord(i);
        filledCircle([x(iy) y(iy)],rad,8,'b'); 
        plot([x(ord(i)), x(ord(iy))], [y(ord(i)), y(ord(iy))]);
    end
    hold on
    n=max(x(:));    m=max(y(:));
    mn=min(x(:));   mm=min(y(:));
    axis([mn-5  n+5  mm-5  m+5])
    grid
end