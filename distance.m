function res=distance(x,y,ord,n)
    res=0;
    for i=1:n
        iy=ord(i);
        a=(x(i)-x(iy))^2; 
        b=(y(i)-y(iy))^2;
        res = res + sqrt(a+b);
    end
end

