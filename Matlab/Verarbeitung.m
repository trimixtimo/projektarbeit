data = Messung02010; 
[rows, cols] = size(data);
newData = data;
for i = 1: rows
    for j = 1: cols
            newData(i, j) = 1;
    end
end