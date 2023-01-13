function order = swift(ord, start, pos)
    [m n] = size(ord);
    x = 1; 
    tmp = ord(start); 
    cpy = zeros(1,n);
    %ord = cpy;
    while( tmp ~= ord(pos))
       cpy(x) = tmp;
       x = x+1;
       tmp = ord(tmp);
       %if mod(x,100)==0, cpy, x, end;
    end
    tmp = start;
    x = x - 1;
    xnt=x;
    if x>1
        while x>1 
            x = x - 1;
            ord(tmp) = cpy(x);
            tmp = ord(tmp);
        end
        ord(tmp)=cpy(xnt);
    end
    order=ord; 
end