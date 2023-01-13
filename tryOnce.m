function [dist Ord2] = tryOnce(x,y,Order,Max,t,rNum,sira)
    %fprintf('Starting TryOnce %d.\n ',sira);
    if nargin<6
        rNum=1000;
    end
    
    Ord2 = repmat(Order,1,1);
    for i1=1:rNum
        dist1=distance(x, y, Ord2, Max);
        ord=Ord2;
        Start=randi(Max-1, 1, 1) + 1;
        Pos  =randi(Max-1, 1, 1) + 1;
        ord = swift(ord, Start, Pos);
        dist2=distance(x, y, ord, Max);

        if (dist1>dist2); Ord2=ord; end;
        if (dist1<dist2)
            p=randi(10000,1,1);p =p/10000;
            p1=exp(-(dist2-dist1)/t);
            if (p<p1); Ord2=ord; end;
        end
    end
    dist=distance(x, y, Ord2, Max);
    %fprintf('End of TryOnce %d.\n ',sira);    
end