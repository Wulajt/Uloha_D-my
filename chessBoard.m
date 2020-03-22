function [] =  chessBoard(Y1)
K = checkerboard < 0.5;
B = double(K);

for l = 1:8
    pom = 9 - l;
    for p = 1:8
        if Y1(p) == l
            B(pom*10-9:pom*10,p*10-9:p*10) = 0.5;
        end
    end
end
figure
imshow(B)
