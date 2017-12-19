function locs=find_min_max(a,flag)
if(strcmp(flag,'min'))
    mn=min(a);
else
    mn=max(a);
end
locs=find(a==mn);
