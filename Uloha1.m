clear;
S = [ones(1,8);8*ones(1,8)]; 
X = round(genrpop(20,S))
v = [3 2 1];
generacie = 1000;

Y = []

for gen = 0:1:generacie
    fitness = fit(X);
    selb = selbest(X, fitness, v);
    Y = [Y fit(selbest(X, fitness, [1]))];
    Y1 = selbest(X, fitness, [1]);
    selt = seltourn(X, fitness, 45);
    X = [selb; selt];
    X = crossov(X, 4, 0);
    X = mutx(X,0.1,S);
    X = round(X)
end

Y1
g = 0:1:gen;
plot(g,Y)


obraz = zeros(8,8);
for l = 1:8
    pom= 9 - l;
    for p = 1:8
        if Y1(p) == l
            obraz (pom, p) = 1;
        end
    end
end

obraz
            