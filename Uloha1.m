clear;
close;

generacie = 2000;
v = [3 2 1];
Amp = [4 4 4 4 4 4 4 4];
g = 0:1:generacie;
nums = [4 4 4 2 2 2 2 2 2];

figure()
hold on

for ble = 0:5
    Y = [];
    X = [];
    S = [ones(1,8);8*ones(1,8)]; 
    X = round(genrpop(60,S));
    X = round(X);
    
    for gen = 0:1:generacie
        fitness = fit(X);
        selb = selbest(X, fitness, v);
        Y = [Y fit(selbest(X, fitness, [1]))];
        Y1 = selbest(X, fitness, [1]);
        seld = seldiv(X, fitness,nums, 0);
        selt = seltourn(X, fitness, 30);
        selA = [selt; seld];
        selA = crossov(selA, 4, 0);
        selA = mutx(selA,0.7,S);
        %selA = muta(selA,0.7,Amp,S);
        X = [selb; selA];
        X = round(X);
    end
    
    Y1
    plot(g,Y)
end
%chessBoard(Y1)
            