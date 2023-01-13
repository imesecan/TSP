function res=FindMinCell(dist)
m=size(dist);
res=dist{1};
for i=2:m
    if res>dist{i}, res=dist{i};end;
end;