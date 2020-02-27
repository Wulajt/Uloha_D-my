t = [5 6 2 5 3 3 5 7];
edges = unique(t)
counts = histc(t(:), edges)
size(counts);
counts(2);
scr = 0;
for m = 1:1:size(counts)
    if counts(m) > 1
        counts(m)
        scr = scr + counts(m) - 1
    end
end