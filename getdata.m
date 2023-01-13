function [x y]= getdata(n,m)
% Produce n random island positions
% the xy position of every island is between 1..m

   x=randi(m-1,1,n)+1;
   y=randi(m-1,1,n)+1;
end