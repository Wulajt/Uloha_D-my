clear;
close;

Y1 = [];
Y2 = [];

isDiag = false; % false - Bez diagonaly, true - S diagonalou

generacie = 2000;
g = 0:1:generacie;

%%% GA pred modifikaciou
v = [3 2 1]; % vektor vyberu top jedincov
M = [];
figure(1)
for I = 1:10
    Y = [];
    X = [];
    S = [ones(1,8);8*ones(1,8)]; % Hranice genov chromozomu 1-8
    X = round(genrpop(20,S)); % Generovanie populacie a jej zaokruhlenie na cele cisla
    
    for gen = 0:1:generacie
        fitness = fit(X, isDiag);
        selb = selbest(X, fitness, v); % vyber top jedincov podla vektoru v
        TOP = selbest(X, fitness, [1]); % top jedinec jednej generacie
        Y = [Y fit(TOP, isDiag)]; % ulozenie score top jedinca za generaciu pre grafy
        selt = seltourn(X, fitness, 14); % turnajovy vyber rodicov buducej populacie
        selt = crossov(selt, 4, 0); % nahodne krizenie rodicov na 4 miestach
        selt = mutx(selt,0.3,S); % mierna globalna mutacia
        X = [selb; selt]; 
        X = round(X); % zaokruhlovanie populacie po krizeni a mutaciach
    end
    
    Y1 = [Y1; TOP]; % ulozenie vystupov prvej GA do matice
    subplot(2,1,1)
    title('Score of tries')
    xlabel('Generation'); 
    ylabel('Score');
    hold on
    plot(g,Y) % vykreslenie grafu score na generaciu jedneho pokusu
    M = [M; Y];
end
m = mean(M); % priemerovanie score vsetkych pokusov na generaciu

subplot(2,1,2)
plot(g,m) % vykreslenie gracu premeru na generaciu vsetkych pokusov
title('Average score of all tries')
xlabel('Generation'); 
ylabel('Score');




%%% GA po modifikacii
v = [5 3 2]; % zvyseny pocet top jedincov 
M = [];
figure(2)
M = [];
for I = 1:10
    Y = [];
    X = [];
    S = [ones(1,8);8*ones(1,8)]; 
    X = round(genrpop(60,S)); % zvysena velkost populacie
    
    for gen = 0:1:generacie
        fitness = fit(X, isDiag);
        selb = selbest(X, fitness, v); % vyber vyssieho poctu top jedincov
        TOP = selbest(X, fitness, [1]);
        Y = [Y fit(TOP, isDiag)];
        selt = seltourn(X, fitness, 50); % zvyseny pocet rodicov buducej generacie
        selt = crossov(selt, 4, 0);
        selt = mutx(selt,0.7,S); % zvysena miera mutacie 
        X = [selb; selt];
        X = round(X);
    end
    
    Y2 = [Y2; TOP];
    subplot(2,1,1)
    title('Score of tries')
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