clear;
close;

Y1 = [];
Y2 = [];

isDiag = false; % false - Bez diagonaly, true - S diagonalou

generacie = 2000;
g = 0:1:generacie;


v = [3 2 1];
M = [];
figure(1)
for I = 1:10
    Y = [];
    X = [];
    S = [ones(1,8);8*ones(1,8)]; 
    X = round(genrpop(20,S));
    X = round(X);
    
    for gen = 0:1:generacie
        fitness = fit(X, isDiag);
        selb = selbest(X, fitness, v);
        TOP = selbest(X, fitness, [1]);
        Y = [Y fit(TOP, isDiag)];
        selt = seltourn(X, fitness, 14);
        selt = crossov(selt, 4, 0);
        selt = mutx(selt,0.3,S);
        X = [selb; selt];
        X = round(X);
    end
    
    Y1 = [Y1; TOP];
    subplot(2,1,1)
    title('Score of all tries')
    xlabel('Generation'); 
    ylabel('Score');
    hold on
    plot(g,Y)
    M = [M; Y];
end
m = mean(M);

subplot(2,1,2)
plot(g,m)
title('Average score of all tries')
xlabel('Generation'); 
ylabel('Score');





v = [5 3 2];
M = [];
figure(2)
M = [];
for I = 1:10
    Y = [];
    X = [];
    S = [ones(1,8);8*ones(1,8)]; 
    X = round(genrpop(60,S));
    X = round(X);
    
    for gen = 0:1:generacie
        fitness = fit(X, isDiag);
        selb = selbest(X, fitness, v);
        TOP = selbest(X, fitness, [1]);
        Y = [Y fit(TOP, isDiag)];
        selt = seltourn(X, fitness, 50);
        selt = crossov(selt, 4, 0);
        selt = mutx(selt,0.7,S);
        X = [selb; selt];
        X = round(X);
    end
    
    Y2 = [Y2; TOP];
    subplot(2,1,1)
    title('Score of all tries')
    xlabel('Generation'); 
    ylabel('Score');
    hold on
    plot(g,Y)
    M = [M; Y];
end
m = mean(M);

subplot(2,1,2)
plot(g,m)
title('Average score of all tries')
xlabel('Generation'); 
ylabel('Score');


chessBoard(Y1(1))
chessBoard(Y2(1))            