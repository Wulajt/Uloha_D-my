clear;
close;

generacie = 2000;
g = 1:1:generacie;
v = [2 1 1];
numOfIslands = 5;
subGenerations = {};
outOfIslands = {};
frequencyOfMigration = 50;
sizeOfPop = 30;
sizeOfTournSel = sizeOfPop - sum(v);

Y = [];
X = [];
S = [-500*ones(1,5);500*ones(1,5)];

X = genrpop(sizeOfPop,S);

for gen = 1:1:generacie
    fitness = eggholder(X);
    selb = selbest(X, fitness, v);
    TOP = selbest(X, fitness, [1]);
    Y = [Y eggholder(TOP)];
    selt = seltourn(X, fitness, sizeOfTournSel);
    selt = crossov(selt, 4, 0);
    selt = mutx(selt,0.7,S);
    X = [selb; selt]; 
end

figure(1)
plot(g,Y)
TOP
eggholder(TOP)


%%%%--------------------------------------------------------

for i = 1:numOfIslands
    subGenerations(i, :) = {genrpop(sizeOfPop,S)};
end


for i = 1:generacie
    
    for j = 1:numOfIslands
        X = cell2mat(subGenerations(j, :));
        fitness = eggholder(X);
        selb = selbest(X, fitness, v);
        TOP = selbest(X, fitness, [1]);
        outOfIslands(j, i) = {eggholder(TOP)};
        selt = seltourn(X, fitness, sizeOfTournSel);
        selt = crossov(selt, 4, 0);
        selt = mutx(selt,0.7,S);
        X = [selb; selt];
        subGenerations(j, :) = {X};
    end
    
    if mod(i,frequencyOfMigration) == 0
        temp_index = 1;
        
        for u = 1:numOfIslands
            if u == numOfIslands
                temp_index = 0;
            else
                temp_index = u;
            end
            currentSubGen = cell2mat(subGenerations(u, :));
            nextSubGen = cell2mat(subGenerations((temp_index + 1), :));
            currentFitness = eggholder(currentSubGen);
            nextFitness = (-1)*eggholder(nextSubGen);
            currentSubGen = selsort(currentSubGen, currentFitness, sizeOfPop); 
            nextSubGen = selsort(nextSubGen, nextFitness, sizeOfPop);
            nextSubGen(1, :) = currentSubGen(1, :);
            subGenerations(u, :) = {currentSubGen};
            subGenerations((temp_index + 1), :) = {nextSubGen};
        end
    end
end

figure(2);
hold on;

output = [];
for j = 1:numOfIslands
    X = cell2mat(subGenerations(j, :));
    fitness = eggholder(X);
    selb = selbest(X, fitness, [1]);
    if j == 1
        output = selb;
    end
    if eggholder(selb) < eggholder(output)
        output = selb;
    end
    plot(g, cell2mat(outOfIslands(j, :)))
end

output
eggholder(output)














